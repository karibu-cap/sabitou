// Code generated by protoc-gen-connect-go. DO NOT EDIT.
//
// Source: identity/v1/authentication.proto

package identityv1connect

import (
	connect "connectrpc.com/connect"
	context "context"
	errors "errors"
	v1 "github.com/karibu-cap/sabitou/protos/gen/go/rpc/identity/v1"
	http "net/http"
	strings "strings"
)

// This is a compile-time assertion to ensure that this generated file and the connect package are
// compatible. If you get a compiler error that this constant is not defined, this code was
// generated with a version of connect newer than the one compiled into your binary. You can fix the
// problem by either regenerating this code with an older version of connect or updating the connect
// version compiled into your binary.
const _ = connect.IsAtLeastVersion1_13_0

const (
	// AuthServiceName is the fully-qualified name of the AuthService service.
	AuthServiceName = "identity.v1.AuthService"
)

// These constants are the fully-qualified names of the RPCs defined in this package. They're
// exposed at runtime as Spec.Procedure and as the final two segments of the HTTP route.
//
// Note that these are different from the fully-qualified method names used by
// google.golang.org/protobuf/reflect/protoreflect. To convert from these constants to
// reflection-formatted method names, remove the leading slash and convert the remaining slash to a
// period.
const (
	// AuthServiceLoginProcedure is the fully-qualified name of the AuthService's Login RPC.
	AuthServiceLoginProcedure = "/identity.v1.AuthService/Login"
	// AuthServiceRequestPasswordResetProcedure is the fully-qualified name of the AuthService's
	// RequestPasswordReset RPC.
	AuthServiceRequestPasswordResetProcedure = "/identity.v1.AuthService/RequestPasswordReset"
	// AuthServiceResetPasswordProcedure is the fully-qualified name of the AuthService's ResetPassword
	// RPC.
	AuthServiceResetPasswordProcedure = "/identity.v1.AuthService/ResetPassword"
)

// AuthServiceClient is a client for the identity.v1.AuthService service.
type AuthServiceClient interface {
	// Authenticate the user with the given credentials.
	Login(context.Context, *connect.Request[v1.LoginRequest]) (*connect.Response[v1.LoginResponse], error)
	// Request the password reset of the user.
	RequestPasswordReset(context.Context, *connect.Request[v1.RequestPasswordResetRequest]) (*connect.Response[v1.RequestPasswordResetResponse], error)
	// Process the password reset request.
	ResetPassword(context.Context, *connect.Request[v1.ResetPasswordRequest]) (*connect.Response[v1.ResetPasswordResponse], error)
}

// NewAuthServiceClient constructs a client for the identity.v1.AuthService service. By default, it
// uses the Connect protocol with the binary Protobuf Codec, asks for gzipped responses, and sends
// uncompressed requests. To use the gRPC or gRPC-Web protocols, supply the connect.WithGRPC() or
// connect.WithGRPCWeb() options.
//
// The URL supplied here should be the base URL for the Connect or gRPC server (for example,
// http://api.acme.com or https://acme.com/grpc).
func NewAuthServiceClient(httpClient connect.HTTPClient, baseURL string, opts ...connect.ClientOption) AuthServiceClient {
	baseURL = strings.TrimRight(baseURL, "/")
	authServiceMethods := v1.File_identity_v1_authentication_proto.Services().ByName("AuthService").Methods()
	return &authServiceClient{
		login: connect.NewClient[v1.LoginRequest, v1.LoginResponse](
			httpClient,
			baseURL+AuthServiceLoginProcedure,
			connect.WithSchema(authServiceMethods.ByName("Login")),
			connect.WithClientOptions(opts...),
		),
		requestPasswordReset: connect.NewClient[v1.RequestPasswordResetRequest, v1.RequestPasswordResetResponse](
			httpClient,
			baseURL+AuthServiceRequestPasswordResetProcedure,
			connect.WithSchema(authServiceMethods.ByName("RequestPasswordReset")),
			connect.WithClientOptions(opts...),
		),
		resetPassword: connect.NewClient[v1.ResetPasswordRequest, v1.ResetPasswordResponse](
			httpClient,
			baseURL+AuthServiceResetPasswordProcedure,
			connect.WithSchema(authServiceMethods.ByName("ResetPassword")),
			connect.WithClientOptions(opts...),
		),
	}
}

// authServiceClient implements AuthServiceClient.
type authServiceClient struct {
	login                *connect.Client[v1.LoginRequest, v1.LoginResponse]
	requestPasswordReset *connect.Client[v1.RequestPasswordResetRequest, v1.RequestPasswordResetResponse]
	resetPassword        *connect.Client[v1.ResetPasswordRequest, v1.ResetPasswordResponse]
}

// Login calls identity.v1.AuthService.Login.
func (c *authServiceClient) Login(ctx context.Context, req *connect.Request[v1.LoginRequest]) (*connect.Response[v1.LoginResponse], error) {
	return c.login.CallUnary(ctx, req)
}

// RequestPasswordReset calls identity.v1.AuthService.RequestPasswordReset.
func (c *authServiceClient) RequestPasswordReset(ctx context.Context, req *connect.Request[v1.RequestPasswordResetRequest]) (*connect.Response[v1.RequestPasswordResetResponse], error) {
	return c.requestPasswordReset.CallUnary(ctx, req)
}

// ResetPassword calls identity.v1.AuthService.ResetPassword.
func (c *authServiceClient) ResetPassword(ctx context.Context, req *connect.Request[v1.ResetPasswordRequest]) (*connect.Response[v1.ResetPasswordResponse], error) {
	return c.resetPassword.CallUnary(ctx, req)
}

// AuthServiceHandler is an implementation of the identity.v1.AuthService service.
type AuthServiceHandler interface {
	// Authenticate the user with the given credentials.
	Login(context.Context, *connect.Request[v1.LoginRequest]) (*connect.Response[v1.LoginResponse], error)
	// Request the password reset of the user.
	RequestPasswordReset(context.Context, *connect.Request[v1.RequestPasswordResetRequest]) (*connect.Response[v1.RequestPasswordResetResponse], error)
	// Process the password reset request.
	ResetPassword(context.Context, *connect.Request[v1.ResetPasswordRequest]) (*connect.Response[v1.ResetPasswordResponse], error)
}

// NewAuthServiceHandler builds an HTTP handler from the service implementation. It returns the path
// on which to mount the handler and the handler itself.
//
// By default, handlers support the Connect, gRPC, and gRPC-Web protocols with the binary Protobuf
// and JSON codecs. They also support gzip compression.
func NewAuthServiceHandler(svc AuthServiceHandler, opts ...connect.HandlerOption) (string, http.Handler) {
	authServiceMethods := v1.File_identity_v1_authentication_proto.Services().ByName("AuthService").Methods()
	authServiceLoginHandler := connect.NewUnaryHandler(
		AuthServiceLoginProcedure,
		svc.Login,
		connect.WithSchema(authServiceMethods.ByName("Login")),
		connect.WithHandlerOptions(opts...),
	)
	authServiceRequestPasswordResetHandler := connect.NewUnaryHandler(
		AuthServiceRequestPasswordResetProcedure,
		svc.RequestPasswordReset,
		connect.WithSchema(authServiceMethods.ByName("RequestPasswordReset")),
		connect.WithHandlerOptions(opts...),
	)
	authServiceResetPasswordHandler := connect.NewUnaryHandler(
		AuthServiceResetPasswordProcedure,
		svc.ResetPassword,
		connect.WithSchema(authServiceMethods.ByName("ResetPassword")),
		connect.WithHandlerOptions(opts...),
	)
	return "/identity.v1.AuthService/", http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		switch r.URL.Path {
		case AuthServiceLoginProcedure:
			authServiceLoginHandler.ServeHTTP(w, r)
		case AuthServiceRequestPasswordResetProcedure:
			authServiceRequestPasswordResetHandler.ServeHTTP(w, r)
		case AuthServiceResetPasswordProcedure:
			authServiceResetPasswordHandler.ServeHTTP(w, r)
		default:
			http.NotFound(w, r)
		}
	})
}

// UnimplementedAuthServiceHandler returns CodeUnimplemented from all methods.
type UnimplementedAuthServiceHandler struct{}

func (UnimplementedAuthServiceHandler) Login(context.Context, *connect.Request[v1.LoginRequest]) (*connect.Response[v1.LoginResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("identity.v1.AuthService.Login is not implemented"))
}

func (UnimplementedAuthServiceHandler) RequestPasswordReset(context.Context, *connect.Request[v1.RequestPasswordResetRequest]) (*connect.Response[v1.RequestPasswordResetResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("identity.v1.AuthService.RequestPasswordReset is not implemented"))
}

func (UnimplementedAuthServiceHandler) ResetPassword(context.Context, *connect.Request[v1.ResetPasswordRequest]) (*connect.Response[v1.ResetPasswordResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("identity.v1.AuthService.ResetPassword is not implemented"))
}
