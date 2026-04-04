// docker/connector/internal/scheduler/scheduler.go
package scheduler

import (
	"context"
	"fmt"
	"log/slog"
	"time"

	"github.com/jackc/pgx/v5"
	"github.com/sabitou/powersync/connector/internal/db"
)

// Scheduler runs background jobs at scheduled intervals.
type Scheduler struct {
	db     *db.DB
	logger *slog.Logger
	ticker *time.Ticker
	stop   chan struct{}
}

// New creates a new Scheduler instance.
func New(database *db.DB, logger *slog.Logger) *Scheduler {
	return &Scheduler{
		db:     database,
		logger: logger,
		stop:   make(chan struct{}),
	}
}

// Start begins the scheduler loop, running jobs every hour.
func (s *Scheduler) Start() {
	s.ticker = time.NewTicker(1 * time.Hour)
	go s.run()
	s.logger.Info("scheduler started", "interval", "1h")
}

// Stop gracefully shuts down the scheduler.
func (s *Scheduler) Stop() {
	if s.ticker != nil {
		s.ticker.Stop()
	}
	close(s.stop)
	s.logger.Info("scheduler stopped")
}

func (s *Scheduler) run() {
	// Run immediately on start, then wait for ticks
	s.runCleanupJob()

	for {
		select {
		case <-s.ticker.C:
			s.runCleanupJob()
		case <-s.stop:
			return
		}
	}
}

// runCleanupJob executes the orphan resource cleanup logic.
func (s *Scheduler) runCleanupJob() {
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Minute)
	defer cancel()

	s.logger.Info("running orphan resource cleanup job")

	processed, removed, err := s.cleanupOrphanResources(ctx)
	if err != nil {
		s.logger.Error("cleanup job failed", "error", err)
		return
	}

	s.logger.Info("cleanup job completed",
		"processed", processed,
		"removed", removed,
	)
}

// cleanupOrphanResources finds orphan resource_links, checks if they're still
// referenced by any entity, marks non-orphan if referenced, or deletes if not.
func (s *Scheduler) cleanupOrphanResources(ctx context.Context) (processed int, removed int, err error) {
	tx, err := s.db.Begin(ctx)
	if err != nil {
		return 0, 0, fmt.Errorf("begin transaction: %w", err)
	}
	defer tx.Rollback(ctx)

	// Get all orphan resource_links
	rows, err := tx.Query(ctx, `
		SELECT ref_id FROM resource_links WHERE is_orphan = TRUE
	`)
	if err != nil {
		return 0, 0, fmt.Errorf("query orphan resources: %w", err)
	}
	defer rows.Close()

	var orphanIDs []string
	for rows.Next() {
		var id string
		if err := rows.Scan(&id); err != nil {
			return 0, 0, fmt.Errorf("scan resource id: %w", err)
		}
		orphanIDs = append(orphanIDs, id)
	}
	if err := rows.Err(); err != nil {
		return 0, 0, fmt.Errorf("iterate orphan rows: %w", err)
	}
	rows.Close()

	for _, resourceID := range orphanIDs {
		isUsed, err := s.isResourceUsed(ctx, tx, resourceID)
		if err != nil {
			s.logger.Error("failed to check resource usage",
				"resource_id", resourceID,
				"error", err,
			)
			continue
		}

		if isUsed {
			// Mark as not orphan since it's being used
			_, err := tx.Exec(ctx, `
				UPDATE resource_links
				SET is_orphan = FALSE
				WHERE ref_id = $1
			`, resourceID)
			if err != nil {
				s.logger.Error("failed to mark resource as non-orphan",
					"resource_id", resourceID,
					"error", err,
				)
				continue
			}
			s.logger.Debug("marked resource as non-orphan", "resource_id", resourceID)
		} else {
			// Delete the orphan resource
			_, err := tx.Exec(ctx, `
				DELETE FROM resource_links WHERE ref_id = $1
			`, resourceID)
			if err != nil {
				s.logger.Error("failed to delete orphan resource",
					"resource_id", resourceID,
					"error", err,
				)
				continue
			}
			removed++
			s.logger.Debug("deleted orphan resource", "resource_id", resourceID)
		}
		processed++
	}

	if err := tx.Commit(ctx); err != nil {
		return processed, removed, fmt.Errorf("commit transaction: %w", err)
	}

	return processed, removed, nil
}

// isResourceUsed checks if a resource_link is referenced by any entity.
func (s *Scheduler) isResourceUsed(ctx context.Context, tx pgx.Tx, resourceID string) (bool, error) {
	var count int

	// Check store_products.images_links_ids (array contains)
	err := tx.QueryRow(ctx, `
		SELECT COUNT(*) FROM store_products WHERE $1 = ANY(images_links_ids)
	`, resourceID).Scan(&count)
	if err != nil {
		return false, fmt.Errorf("check store_products: %w", err)
	}
	if count > 0 {
		return true, nil
	}

	// Check global_products.images_links_ids (array contains)
	err = tx.QueryRow(ctx, `
		SELECT COUNT(*) FROM global_products WHERE $1 = ANY(images_links_ids)
	`, resourceID).Scan(&count)
	if err != nil {
		return false, fmt.Errorf("check global_products: %w", err)
	}
	if count > 0 {
		return true, nil
	}

	// Check batches.images_links_ids (array contains)
	err = tx.QueryRow(ctx, `
		SELECT COUNT(*) FROM batches WHERE $1 = ANY(images_links_ids)
	`, resourceID).Scan(&count)
	if err != nil {
		return false, fmt.Errorf("check batches: %w", err)
	}
	if count > 0 {
		return true, nil
	}

	// Check stores.logo_link_id (single reference)
	err = tx.QueryRow(ctx, `
		SELECT COUNT(*) FROM stores WHERE logo_link_id = $1
	`, resourceID).Scan(&count)
	if err != nil {
		return false, fmt.Errorf("check stores: %w", err)
	}
	if count > 0 {
		return true, nil
	}

	// Check businesses.logo_link_id (single reference)
	err = tx.QueryRow(ctx, `
		SELECT COUNT(*) FROM businesses WHERE logo_link_id = $1
	`, resourceID).Scan(&count)
	if err != nil {
		return false, fmt.Errorf("check businesses: %w", err)
	}
	if count > 0 {
		return true, nil
	}

	// Check suppliers.logo_link_id (single reference)
	err = tx.QueryRow(ctx, `
		SELECT COUNT(*) FROM suppliers WHERE logo_link_id = $1
	`, resourceID).Scan(&count)
	if err != nil {
		return false, fmt.Errorf("check suppliers.logo_link_id: %w", err)
	}
	if count > 0 {
		return true, nil
	}

	// Check suppliers.external_links_ids (array contains)
	err = tx.QueryRow(ctx, `
		SELECT COUNT(*) FROM suppliers WHERE $1 = ANY(external_links_ids)
	`, resourceID).Scan(&count)
	if err != nil {
		return false, fmt.Errorf("check suppliers.external_links_ids: %w", err)
	}
	if count > 0 {
		return true, nil
	}

	return false, nil
}
