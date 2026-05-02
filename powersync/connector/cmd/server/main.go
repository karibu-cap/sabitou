package main

import (
	"context"
	"log/slog"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	"connectrpc.com/connect"
	identityv1connect "github.com/karibu-cap/sabitou/protos/gen/go/rpc/identity/v1/identityv1connect"
	"github.com/sabitou/powersync/connector/internal/auth"
	"github.com/sabitou/powersync/connector/internal/config"
	"github.com/sabitou/powersync/connector/internal/db"
	"github.com/sabitou/powersync/connector/internal/middleware"
	"github.com/sabitou/powersync/connector/internal/scheduler"
	"github.com/sabitou/powersync/connector/internal/sync"
)

func main() {
	logger := slog.New(slog.NewJSONHandler(os.Stdout, &slog.HandlerOptions{
		Level: slog.LevelInfo,
	}))

	cfg := config.Load()

	// -------------------------------------------------------------------------
	// Database
	// -------------------------------------------------------------------------
	database, err := db.New(context.Background(), cfg.DatabaseURL)
	if err != nil {
		logger.Error("database connection failed", "error", err)
		os.Exit(1)
	}
	defer database.Close()
	logger.Info("database connected")

	// -------------------------------------------------------------------------
	// Scheduler (orphan resource cleanup)
	// -------------------------------------------------------------------------
	cleanupScheduler := scheduler.New(database, logger)
	cleanupScheduler.Start()
	defer cleanupScheduler.Stop()
	logger.Info("scheduler started", "job", "orphan_resource_cleanup")

	// -------------------------------------------------------------------------
	// JWT service (generates/loads RSA key pair on first start)
	// -------------------------------------------------------------------------
	jwtService, err := auth.NewJWTService(
		cfg.PrivateKeyPath,
		cfg.PublicKeyPath,
		cfg.JWTKeyID,
		cfg.AccessTokenTTLHours,
		cfg.RefreshTokenTTLDays,
	)
	if err != nil {
		logger.Error("JWT service init failed", "error", err)
		os.Exit(1)
	}
	logger.Info("JWT service ready", "key_id", cfg.JWTKeyID)

	// -------------------------------------------------------------------------
	// Handlers
	// -------------------------------------------------------------------------
	authHandler := auth.NewHandler(database, jwtService, logger)
	syncHandler := sync.NewHandler(database, logger)
	authMiddleware := middleware.NewAuthMiddleware(jwtService)

	// -------------------------------------------------------------------------
	// Router (Go 1.22 pattern-matching ServeMux)
	// -------------------------------------------------------------------------
	mux := http.NewServeMux()

	// Public
	mux.HandleFunc("GET /health", healthHandler)
	mux.HandleFunc("GET /.well-known/jwks.json", jwtService.JWKSHandler)

	// ConnectRPC Auth Service
	authPath, authSvcHandler := identityv1connect.NewAuthServiceHandler(authHandler)
	mux.Handle(authPath, authSvcHandler)

	// ConnectRPC User Service (CreateUserDirect, InviteUser, etc.)
	// authHandler also implements UserServiceHandler (user_handler.go).
	userPath, userSvcHandler := identityv1connect.NewUserServiceHandler(
		authHandler,
		// Protect all UserService RPCs — admin must be authenticated.
		connect.WithInterceptors(authMiddleware.ConnectInterceptor()),
	)
	mux.Handle(userPath, userSvcHandler)

	// Protected
	mux.Handle("DELETE /api/v1/auth/logout",
		authMiddleware.Wrap(http.HandlerFunc(authHandler.Logout)))
	mux.Handle("POST /api/v1/sync/upload",
		authMiddleware.Wrap(http.HandlerFunc(syncHandler.Upload)))

	// -------------------------------------------------------------------------
	// HTTP server with graceful shutdown
	// -------------------------------------------------------------------------
	server := &http.Server{
		Addr:         ":" + cfg.Port,
		Handler:      withCORS(mux),
		ReadTimeout:  15 * time.Second,
		WriteTimeout: 15 * time.Second,
		IdleTimeout:  60 * time.Second,
	}

	quit := make(chan os.Signal, 1)
	signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)

	go func() {
		logger.Info("server listening", "port", cfg.Port)
		if err := server.ListenAndServe(); err != nil && err != http.ErrServerClosed {
			logger.Error("server error", "error", err)
			os.Exit(1)
		}
	}()

	<-quit
	logger.Info("shutting down")

	ctx, cancel := context.WithTimeout(context.Background(), 30*time.Second)
	defer cancel()

	if err := server.Shutdown(ctx); err != nil {
		logger.Error("forced shutdown", "error", err)
	}
}

func healthHandler(w http.ResponseWriter, _ *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	w.Write([]byte(`{"status":"ok"}`)) //nolint:errcheck
}

// withCORS adds permissive CORS headers — tighten for production.
func withCORS(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Access-Control-Allow-Origin", "*")
		w.Header().Set("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS")
		w.Header().Set("Access-Control-Allow-Headers", "*")
		w.Header().Set("Access-Control-Expose-Headers", "*")

		if r.Method == http.MethodOptions {
			w.WriteHeader(http.StatusNoContent)
			return
		}

		next.ServeHTTP(w, r)
	})
}
