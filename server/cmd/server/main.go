package main

import (
	"net/http"

	"github.com/sabitou/internal/services"
	"github.com/sabitou/rpc/identity"
)

func main() {
	// server := &haberdasherserver.Server{} // implements Haberdasher interface

	userService := &services.UserService{}
	twirpHandler := identity.NewUserServiceServer(userService)

	http.ListenAndServe(":8080", twirpHandler)
}
