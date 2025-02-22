// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.5.1
// - protoc             (unknown)
// source: business_user/v1/business_user.proto

package businessUserV1

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.64.0 or later.
const _ = grpc.SupportPackageIsVersion9

const (
	BusinessUserService_CreateBusinessUser_FullMethodName = "/business_user.v1.BusinessUserService/CreateBusinessUser"
	BusinessUserService_GetBusinessUser_FullMethodName    = "/business_user.v1.BusinessUserService/GetBusinessUser"
	BusinessUserService_UpdateBusinessUser_FullMethodName = "/business_user.v1.BusinessUserService/UpdateBusinessUser"
	BusinessUserService_DeleteBusinessUser_FullMethodName = "/business_user.v1.BusinessUserService/DeleteBusinessUser"
)

// BusinessUserServiceClient is the client API for BusinessUserService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type BusinessUserServiceClient interface {
	CreateBusinessUser(ctx context.Context, in *CreateBusinessUserRequest, opts ...grpc.CallOption) (*CreateBusinessUserResponse, error)
	GetBusinessUser(ctx context.Context, in *GetBusinessUserRequest, opts ...grpc.CallOption) (*GetBusinessUserResponse, error)
	UpdateBusinessUser(ctx context.Context, in *UpdateBusinessUserRequest, opts ...grpc.CallOption) (*UpdateBusinessUserResponse, error)
	DeleteBusinessUser(ctx context.Context, in *DeleteBusinessUserRequest, opts ...grpc.CallOption) (*DeleteBusinessUserResponse, error)
}

type businessUserServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewBusinessUserServiceClient(cc grpc.ClientConnInterface) BusinessUserServiceClient {
	return &businessUserServiceClient{cc}
}

func (c *businessUserServiceClient) CreateBusinessUser(ctx context.Context, in *CreateBusinessUserRequest, opts ...grpc.CallOption) (*CreateBusinessUserResponse, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(CreateBusinessUserResponse)
	err := c.cc.Invoke(ctx, BusinessUserService_CreateBusinessUser_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *businessUserServiceClient) GetBusinessUser(ctx context.Context, in *GetBusinessUserRequest, opts ...grpc.CallOption) (*GetBusinessUserResponse, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(GetBusinessUserResponse)
	err := c.cc.Invoke(ctx, BusinessUserService_GetBusinessUser_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *businessUserServiceClient) UpdateBusinessUser(ctx context.Context, in *UpdateBusinessUserRequest, opts ...grpc.CallOption) (*UpdateBusinessUserResponse, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(UpdateBusinessUserResponse)
	err := c.cc.Invoke(ctx, BusinessUserService_UpdateBusinessUser_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *businessUserServiceClient) DeleteBusinessUser(ctx context.Context, in *DeleteBusinessUserRequest, opts ...grpc.CallOption) (*DeleteBusinessUserResponse, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(DeleteBusinessUserResponse)
	err := c.cc.Invoke(ctx, BusinessUserService_DeleteBusinessUser_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// BusinessUserServiceServer is the server API for BusinessUserService service.
// All implementations must embed UnimplementedBusinessUserServiceServer
// for forward compatibility.
type BusinessUserServiceServer interface {
	CreateBusinessUser(context.Context, *CreateBusinessUserRequest) (*CreateBusinessUserResponse, error)
	GetBusinessUser(context.Context, *GetBusinessUserRequest) (*GetBusinessUserResponse, error)
	UpdateBusinessUser(context.Context, *UpdateBusinessUserRequest) (*UpdateBusinessUserResponse, error)
	DeleteBusinessUser(context.Context, *DeleteBusinessUserRequest) (*DeleteBusinessUserResponse, error)
	mustEmbedUnimplementedBusinessUserServiceServer()
}

// UnimplementedBusinessUserServiceServer must be embedded to have
// forward compatible implementations.
//
// NOTE: this should be embedded by value instead of pointer to avoid a nil
// pointer dereference when methods are called.
type UnimplementedBusinessUserServiceServer struct{}

func (UnimplementedBusinessUserServiceServer) CreateBusinessUser(context.Context, *CreateBusinessUserRequest) (*CreateBusinessUserResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CreateBusinessUser not implemented")
}
func (UnimplementedBusinessUserServiceServer) GetBusinessUser(context.Context, *GetBusinessUserRequest) (*GetBusinessUserResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetBusinessUser not implemented")
}
func (UnimplementedBusinessUserServiceServer) UpdateBusinessUser(context.Context, *UpdateBusinessUserRequest) (*UpdateBusinessUserResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method UpdateBusinessUser not implemented")
}
func (UnimplementedBusinessUserServiceServer) DeleteBusinessUser(context.Context, *DeleteBusinessUserRequest) (*DeleteBusinessUserResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method DeleteBusinessUser not implemented")
}
func (UnimplementedBusinessUserServiceServer) mustEmbedUnimplementedBusinessUserServiceServer() {}
func (UnimplementedBusinessUserServiceServer) testEmbeddedByValue()                             {}

// UnsafeBusinessUserServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to BusinessUserServiceServer will
// result in compilation errors.
type UnsafeBusinessUserServiceServer interface {
	mustEmbedUnimplementedBusinessUserServiceServer()
}

func RegisterBusinessUserServiceServer(s grpc.ServiceRegistrar, srv BusinessUserServiceServer) {
	// If the following call pancis, it indicates UnimplementedBusinessUserServiceServer was
	// embedded by pointer and is nil.  This will cause panics if an
	// unimplemented method is ever invoked, so we test this at initialization
	// time to prevent it from happening at runtime later due to I/O.
	if t, ok := srv.(interface{ testEmbeddedByValue() }); ok {
		t.testEmbeddedByValue()
	}
	s.RegisterService(&BusinessUserService_ServiceDesc, srv)
}

func _BusinessUserService_CreateBusinessUser_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(CreateBusinessUserRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(BusinessUserServiceServer).CreateBusinessUser(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: BusinessUserService_CreateBusinessUser_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(BusinessUserServiceServer).CreateBusinessUser(ctx, req.(*CreateBusinessUserRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _BusinessUserService_GetBusinessUser_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetBusinessUserRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(BusinessUserServiceServer).GetBusinessUser(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: BusinessUserService_GetBusinessUser_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(BusinessUserServiceServer).GetBusinessUser(ctx, req.(*GetBusinessUserRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _BusinessUserService_UpdateBusinessUser_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(UpdateBusinessUserRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(BusinessUserServiceServer).UpdateBusinessUser(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: BusinessUserService_UpdateBusinessUser_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(BusinessUserServiceServer).UpdateBusinessUser(ctx, req.(*UpdateBusinessUserRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _BusinessUserService_DeleteBusinessUser_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(DeleteBusinessUserRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(BusinessUserServiceServer).DeleteBusinessUser(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: BusinessUserService_DeleteBusinessUser_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(BusinessUserServiceServer).DeleteBusinessUser(ctx, req.(*DeleteBusinessUserRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// BusinessUserService_ServiceDesc is the grpc.ServiceDesc for BusinessUserService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var BusinessUserService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "business_user.v1.BusinessUserService",
	HandlerType: (*BusinessUserServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "CreateBusinessUser",
			Handler:    _BusinessUserService_CreateBusinessUser_Handler,
		},
		{
			MethodName: "GetBusinessUser",
			Handler:    _BusinessUserService_GetBusinessUser_Handler,
		},
		{
			MethodName: "UpdateBusinessUser",
			Handler:    _BusinessUserService_UpdateBusinessUser_Handler,
		},
		{
			MethodName: "DeleteBusinessUser",
			Handler:    _BusinessUserService_DeleteBusinessUser_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "business_user/v1/business_user.proto",
}
