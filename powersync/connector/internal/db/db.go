// docker/connector/internal/db/db.go
package db

import (
	"context"
	"fmt"
	"time"

	"github.com/jackc/pgx/v5/pgxpool"
)

// DB wraps a pgxpool.Pool, providing the application's database handle.
type DB struct {
	*pgxpool.Pool
}

// New creates a new PostgreSQL connection pool, retrying until the database
// is ready (useful during container start-up when Postgres may not be ready yet).
func New(ctx context.Context, dsn string) (*DB, error) {
	cfg, err := pgxpool.ParseConfig(dsn)
	if err != nil {
		return nil, fmt.Errorf("parse dsn: %w", err)
	}

	cfg.MaxConns = 20
	cfg.MinConns = 2
	cfg.MaxConnLifetime = time.Hour
	cfg.MaxConnIdleTime = 30 * time.Minute
	cfg.HealthCheckPeriod = time.Minute

	const maxRetries = 10
	for i := range maxRetries {
		pool, err := pgxpool.NewWithConfig(ctx, cfg)
		if err == nil {
			if pingErr := pool.Ping(ctx); pingErr == nil {
				return &DB{pool}, nil
			}
			pool.Close()
		}
		if i < maxRetries-1 {
			time.Sleep(2 * time.Second)
		}
	}

	return nil, fmt.Errorf("failed to connect to database after %d retries", maxRetries)
}