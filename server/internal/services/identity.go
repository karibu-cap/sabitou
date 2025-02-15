package services

import (
	"context"

	"github.com/sabitou/rpc/identity"
)

// UserService implements the User service
type UserService struct{}

func (s *UserService) GetUser(ctx context.Context, req *identity.GetUserRequest) (User *identity.GetUserResponse, err error) {
	x := req.Id
	return &identity.GetUserResponse{}, nil
}

func (s *UserService) UpdateUser(ctx context.Context, req *identity.UpdateUserRequest) (User *identity.UpdateUserResponse, err error) {
	return &identity.UpdateUserResponse{}, nil
}

func (s *UserService) DeleteUser(ctx context.Context, req *identity.DeleteUserRequest) (response *identity.DeleteUserResponse, err error) {
	return &identity.DeleteUserResponse{}, nil
}

func (s *UserService) ChangePassword(ctx context.Context, req *identity.ChangePasswordRequest) (response *identity.ChangePasswordResponse, err error) {
	return &identity.ChangePasswordResponse{}, nil
}
