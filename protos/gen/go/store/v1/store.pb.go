// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.36.5
// 	protoc        (unknown)
// source: store/v1/store.proto

package storev1

import (
	_ "buf.build/gen/go/bufbuild/protovalidate/protocolbuffers/go/buf/validate"
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
	unsafe "unsafe"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

// Stores are used to store products.
// Note: A store is not always a shop.
type Store struct {
	state protoimpl.MessageState `protogen:"open.v1"`
	// The unique identifier of the store.
	RefId *string `protobuf:"bytes,1,opt,name=ref_id,json=refId,proto3,oneof" json:"ref_id,omitempty"`
	// The address of the store.
	Address *string `protobuf:"bytes,2,opt,name=address,proto3,oneof" json:"address,omitempty"`
	// The name of the store.
	Name string `protobuf:"bytes,3,opt,name=name,proto3" json:"name,omitempty"`
	// The description of the store.
	Description *string `protobuf:"bytes,5,opt,name=description,proto3,oneof" json:"description,omitempty"`
	// The id of the media of the logo of the store.
	LogoMediaId *string `protobuf:"bytes,6,opt,name=logo_media_id,json=logoMediaId,proto3,oneof" json:"logo_media_id,omitempty"`
	// The ids of the media of the links of the store.
	LinksMediaIds *string `protobuf:"bytes,8,opt,name=links_media_ids,json=linksMediaIds,proto3,oneof" json:"links_media_ids,omitempty"`
	// The id of the business of the store.
	BusinessId    string `protobuf:"bytes,7,opt,name=business_id,json=businessId,proto3" json:"business_id,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *Store) Reset() {
	*x = Store{}
	mi := &file_store_v1_store_proto_msgTypes[0]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *Store) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Store) ProtoMessage() {}

func (x *Store) ProtoReflect() protoreflect.Message {
	mi := &file_store_v1_store_proto_msgTypes[0]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Store.ProtoReflect.Descriptor instead.
func (*Store) Descriptor() ([]byte, []int) {
	return file_store_v1_store_proto_rawDescGZIP(), []int{0}
}

func (x *Store) GetRefId() string {
	if x != nil && x.RefId != nil {
		return *x.RefId
	}
	return ""
}

func (x *Store) GetAddress() string {
	if x != nil && x.Address != nil {
		return *x.Address
	}
	return ""
}

func (x *Store) GetName() string {
	if x != nil {
		return x.Name
	}
	return ""
}

func (x *Store) GetDescription() string {
	if x != nil && x.Description != nil {
		return *x.Description
	}
	return ""
}

func (x *Store) GetLogoMediaId() string {
	if x != nil && x.LogoMediaId != nil {
		return *x.LogoMediaId
	}
	return ""
}

func (x *Store) GetLinksMediaIds() string {
	if x != nil && x.LinksMediaIds != nil {
		return *x.LinksMediaIds
	}
	return ""
}

func (x *Store) GetBusinessId() string {
	if x != nil {
		return x.BusinessId
	}
	return ""
}

type CreateStoreRequest struct {
	state protoimpl.MessageState `protogen:"open.v1"`
	// The store information to create.
	Store *Store `protobuf:"bytes,1,opt,name=store,proto3" json:"store,omitempty"`
	// The raw image of the logo of the store.
	LogoRawImage  []byte `protobuf:"bytes,2,opt,name=logo_raw_image,json=logoRawImage,proto3,oneof" json:"logo_raw_image,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *CreateStoreRequest) Reset() {
	*x = CreateStoreRequest{}
	mi := &file_store_v1_store_proto_msgTypes[1]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *CreateStoreRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateStoreRequest) ProtoMessage() {}

func (x *CreateStoreRequest) ProtoReflect() protoreflect.Message {
	mi := &file_store_v1_store_proto_msgTypes[1]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateStoreRequest.ProtoReflect.Descriptor instead.
func (*CreateStoreRequest) Descriptor() ([]byte, []int) {
	return file_store_v1_store_proto_rawDescGZIP(), []int{1}
}

func (x *CreateStoreRequest) GetStore() *Store {
	if x != nil {
		return x.Store
	}
	return nil
}

func (x *CreateStoreRequest) GetLogoRawImage() []byte {
	if x != nil {
		return x.LogoRawImage
	}
	return nil
}

type CreateStoreResponse struct {
	state protoimpl.MessageState `protogen:"open.v1"`
	// The unique identifier of the created store.
	RefId         string `protobuf:"bytes,1,opt,name=ref_id,json=refId,proto3" json:"ref_id,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *CreateStoreResponse) Reset() {
	*x = CreateStoreResponse{}
	mi := &file_store_v1_store_proto_msgTypes[2]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *CreateStoreResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateStoreResponse) ProtoMessage() {}

func (x *CreateStoreResponse) ProtoReflect() protoreflect.Message {
	mi := &file_store_v1_store_proto_msgTypes[2]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateStoreResponse.ProtoReflect.Descriptor instead.
func (*CreateStoreResponse) Descriptor() ([]byte, []int) {
	return file_store_v1_store_proto_rawDescGZIP(), []int{2}
}

func (x *CreateStoreResponse) GetRefId() string {
	if x != nil {
		return x.RefId
	}
	return ""
}

type GetStoreRequest struct {
	state protoimpl.MessageState `protogen:"open.v1"`
	// The unique identifier of the store to retrieve.
	RefId         string `protobuf:"bytes,1,opt,name=ref_id,json=refId,proto3" json:"ref_id,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *GetStoreRequest) Reset() {
	*x = GetStoreRequest{}
	mi := &file_store_v1_store_proto_msgTypes[3]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *GetStoreRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetStoreRequest) ProtoMessage() {}

func (x *GetStoreRequest) ProtoReflect() protoreflect.Message {
	mi := &file_store_v1_store_proto_msgTypes[3]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetStoreRequest.ProtoReflect.Descriptor instead.
func (*GetStoreRequest) Descriptor() ([]byte, []int) {
	return file_store_v1_store_proto_rawDescGZIP(), []int{3}
}

func (x *GetStoreRequest) GetRefId() string {
	if x != nil {
		return x.RefId
	}
	return ""
}

type GetStoreResponse struct {
	state protoimpl.MessageState `protogen:"open.v1"`
	// The retrieved store data.
	Store         *Store `protobuf:"bytes,1,opt,name=store,proto3" json:"store,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *GetStoreResponse) Reset() {
	*x = GetStoreResponse{}
	mi := &file_store_v1_store_proto_msgTypes[4]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *GetStoreResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetStoreResponse) ProtoMessage() {}

func (x *GetStoreResponse) ProtoReflect() protoreflect.Message {
	mi := &file_store_v1_store_proto_msgTypes[4]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetStoreResponse.ProtoReflect.Descriptor instead.
func (*GetStoreResponse) Descriptor() ([]byte, []int) {
	return file_store_v1_store_proto_rawDescGZIP(), []int{4}
}

func (x *GetStoreResponse) GetStore() *Store {
	if x != nil {
		return x.Store
	}
	return nil
}

type UpdateStoreRequest struct {
	state protoimpl.MessageState `protogen:"open.v1"`
	// The store information to update.
	// Note:Only the fields that are set will be updated.
	Store *Store `protobuf:"bytes,1,opt,name=store,proto3" json:"store,omitempty"`
	// The raw image of the logo of the store.
	LogoRawImage  []byte `protobuf:"bytes,2,opt,name=logo_raw_image,json=logoRawImage,proto3,oneof" json:"logo_raw_image,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *UpdateStoreRequest) Reset() {
	*x = UpdateStoreRequest{}
	mi := &file_store_v1_store_proto_msgTypes[5]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *UpdateStoreRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*UpdateStoreRequest) ProtoMessage() {}

func (x *UpdateStoreRequest) ProtoReflect() protoreflect.Message {
	mi := &file_store_v1_store_proto_msgTypes[5]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use UpdateStoreRequest.ProtoReflect.Descriptor instead.
func (*UpdateStoreRequest) Descriptor() ([]byte, []int) {
	return file_store_v1_store_proto_rawDescGZIP(), []int{5}
}

func (x *UpdateStoreRequest) GetStore() *Store {
	if x != nil {
		return x.Store
	}
	return nil
}

func (x *UpdateStoreRequest) GetLogoRawImage() []byte {
	if x != nil {
		return x.LogoRawImage
	}
	return nil
}

type UpdateStoreResponse struct {
	state protoimpl.MessageState `protogen:"open.v1"`
	// The updated store data.
	Store         *Store `protobuf:"bytes,1,opt,name=store,proto3" json:"store,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *UpdateStoreResponse) Reset() {
	*x = UpdateStoreResponse{}
	mi := &file_store_v1_store_proto_msgTypes[6]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *UpdateStoreResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*UpdateStoreResponse) ProtoMessage() {}

func (x *UpdateStoreResponse) ProtoReflect() protoreflect.Message {
	mi := &file_store_v1_store_proto_msgTypes[6]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use UpdateStoreResponse.ProtoReflect.Descriptor instead.
func (*UpdateStoreResponse) Descriptor() ([]byte, []int) {
	return file_store_v1_store_proto_rawDescGZIP(), []int{6}
}

func (x *UpdateStoreResponse) GetStore() *Store {
	if x != nil {
		return x.Store
	}
	return nil
}

type DeleteStoreRequest struct {
	state protoimpl.MessageState `protogen:"open.v1"`
	// The unique identifier of the store to delete.
	RefId         string `protobuf:"bytes,1,opt,name=ref_id,json=refId,proto3" json:"ref_id,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *DeleteStoreRequest) Reset() {
	*x = DeleteStoreRequest{}
	mi := &file_store_v1_store_proto_msgTypes[7]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *DeleteStoreRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DeleteStoreRequest) ProtoMessage() {}

func (x *DeleteStoreRequest) ProtoReflect() protoreflect.Message {
	mi := &file_store_v1_store_proto_msgTypes[7]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DeleteStoreRequest.ProtoReflect.Descriptor instead.
func (*DeleteStoreRequest) Descriptor() ([]byte, []int) {
	return file_store_v1_store_proto_rawDescGZIP(), []int{7}
}

func (x *DeleteStoreRequest) GetRefId() string {
	if x != nil {
		return x.RefId
	}
	return ""
}

type DeleteStoreResponse struct {
	state protoimpl.MessageState `protogen:"open.v1"`
	// Whether the store was successfully deleted.
	Success       bool `protobuf:"varint,1,opt,name=success,proto3" json:"success,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *DeleteStoreResponse) Reset() {
	*x = DeleteStoreResponse{}
	mi := &file_store_v1_store_proto_msgTypes[8]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *DeleteStoreResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DeleteStoreResponse) ProtoMessage() {}

func (x *DeleteStoreResponse) ProtoReflect() protoreflect.Message {
	mi := &file_store_v1_store_proto_msgTypes[8]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DeleteStoreResponse.ProtoReflect.Descriptor instead.
func (*DeleteStoreResponse) Descriptor() ([]byte, []int) {
	return file_store_v1_store_proto_rawDescGZIP(), []int{8}
}

func (x *DeleteStoreResponse) GetSuccess() bool {
	if x != nil {
		return x.Success
	}
	return false
}

var File_store_v1_store_proto protoreflect.FileDescriptor

var file_store_v1_store_proto_rawDesc = string([]byte{
	0x0a, 0x14, 0x73, 0x74, 0x6f, 0x72, 0x65, 0x2f, 0x76, 0x31, 0x2f, 0x73, 0x74, 0x6f, 0x72, 0x65,
	0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x08, 0x73, 0x74, 0x6f, 0x72, 0x65, 0x2e, 0x76, 0x31,
	0x1a, 0x1b, 0x62, 0x75, 0x66, 0x2f, 0x76, 0x61, 0x6c, 0x69, 0x64, 0x61, 0x74, 0x65, 0x2f, 0x76,
	0x61, 0x6c, 0x69, 0x64, 0x61, 0x74, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0xc1, 0x02,
	0x0a, 0x05, 0x53, 0x74, 0x6f, 0x72, 0x65, 0x12, 0x1a, 0x0a, 0x06, 0x72, 0x65, 0x66, 0x5f, 0x69,
	0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x48, 0x00, 0x52, 0x05, 0x72, 0x65, 0x66, 0x49, 0x64,
	0x88, 0x01, 0x01, 0x12, 0x1d, 0x0a, 0x07, 0x61, 0x64, 0x64, 0x72, 0x65, 0x73, 0x73, 0x18, 0x02,
	0x20, 0x01, 0x28, 0x09, 0x48, 0x01, 0x52, 0x07, 0x61, 0x64, 0x64, 0x72, 0x65, 0x73, 0x73, 0x88,
	0x01, 0x01, 0x12, 0x12, 0x0a, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x12, 0x25, 0x0a, 0x0b, 0x64, 0x65, 0x73, 0x63, 0x72, 0x69,
	0x70, 0x74, 0x69, 0x6f, 0x6e, 0x18, 0x05, 0x20, 0x01, 0x28, 0x09, 0x48, 0x02, 0x52, 0x0b, 0x64,
	0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x88, 0x01, 0x01, 0x12, 0x27, 0x0a,
	0x0d, 0x6c, 0x6f, 0x67, 0x6f, 0x5f, 0x6d, 0x65, 0x64, 0x69, 0x61, 0x5f, 0x69, 0x64, 0x18, 0x06,
	0x20, 0x01, 0x28, 0x09, 0x48, 0x03, 0x52, 0x0b, 0x6c, 0x6f, 0x67, 0x6f, 0x4d, 0x65, 0x64, 0x69,
	0x61, 0x49, 0x64, 0x88, 0x01, 0x01, 0x12, 0x2b, 0x0a, 0x0f, 0x6c, 0x69, 0x6e, 0x6b, 0x73, 0x5f,
	0x6d, 0x65, 0x64, 0x69, 0x61, 0x5f, 0x69, 0x64, 0x73, 0x18, 0x08, 0x20, 0x01, 0x28, 0x09, 0x48,
	0x04, 0x52, 0x0d, 0x6c, 0x69, 0x6e, 0x6b, 0x73, 0x4d, 0x65, 0x64, 0x69, 0x61, 0x49, 0x64, 0x73,
	0x88, 0x01, 0x01, 0x12, 0x1f, 0x0a, 0x0b, 0x62, 0x75, 0x73, 0x69, 0x6e, 0x65, 0x73, 0x73, 0x5f,
	0x69, 0x64, 0x18, 0x07, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0a, 0x62, 0x75, 0x73, 0x69, 0x6e, 0x65,
	0x73, 0x73, 0x49, 0x64, 0x42, 0x09, 0x0a, 0x07, 0x5f, 0x72, 0x65, 0x66, 0x5f, 0x69, 0x64, 0x42,
	0x0a, 0x0a, 0x08, 0x5f, 0x61, 0x64, 0x64, 0x72, 0x65, 0x73, 0x73, 0x42, 0x0e, 0x0a, 0x0c, 0x5f,
	0x64, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x42, 0x10, 0x0a, 0x0e, 0x5f,
	0x6c, 0x6f, 0x67, 0x6f, 0x5f, 0x6d, 0x65, 0x64, 0x69, 0x61, 0x5f, 0x69, 0x64, 0x42, 0x12, 0x0a,
	0x10, 0x5f, 0x6c, 0x69, 0x6e, 0x6b, 0x73, 0x5f, 0x6d, 0x65, 0x64, 0x69, 0x61, 0x5f, 0x69, 0x64,
	0x73, 0x22, 0x79, 0x0a, 0x12, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x53, 0x74, 0x6f, 0x72, 0x65,
	0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x25, 0x0a, 0x05, 0x73, 0x74, 0x6f, 0x72, 0x65,
	0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x0f, 0x2e, 0x73, 0x74, 0x6f, 0x72, 0x65, 0x2e, 0x76,
	0x31, 0x2e, 0x53, 0x74, 0x6f, 0x72, 0x65, 0x52, 0x05, 0x73, 0x74, 0x6f, 0x72, 0x65, 0x12, 0x29,
	0x0a, 0x0e, 0x6c, 0x6f, 0x67, 0x6f, 0x5f, 0x72, 0x61, 0x77, 0x5f, 0x69, 0x6d, 0x61, 0x67, 0x65,
	0x18, 0x02, 0x20, 0x01, 0x28, 0x0c, 0x48, 0x00, 0x52, 0x0c, 0x6c, 0x6f, 0x67, 0x6f, 0x52, 0x61,
	0x77, 0x49, 0x6d, 0x61, 0x67, 0x65, 0x88, 0x01, 0x01, 0x42, 0x11, 0x0a, 0x0f, 0x5f, 0x6c, 0x6f,
	0x67, 0x6f, 0x5f, 0x72, 0x61, 0x77, 0x5f, 0x69, 0x6d, 0x61, 0x67, 0x65, 0x22, 0x38, 0x0a, 0x13,
	0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x53, 0x74, 0x6f, 0x72, 0x65, 0x52, 0x65, 0x73, 0x70, 0x6f,
	0x6e, 0x73, 0x65, 0x12, 0x21, 0x0a, 0x06, 0x72, 0x65, 0x66, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20,
	0x01, 0x28, 0x09, 0x42, 0x0a, 0xba, 0x48, 0x07, 0xc8, 0x01, 0x01, 0x72, 0x02, 0x10, 0x03, 0x52,
	0x05, 0x72, 0x65, 0x66, 0x49, 0x64, 0x22, 0x34, 0x0a, 0x0f, 0x47, 0x65, 0x74, 0x53, 0x74, 0x6f,
	0x72, 0x65, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x21, 0x0a, 0x06, 0x72, 0x65, 0x66,
	0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x42, 0x0a, 0xba, 0x48, 0x07, 0xc8, 0x01,
	0x01, 0x72, 0x02, 0x10, 0x03, 0x52, 0x05, 0x72, 0x65, 0x66, 0x49, 0x64, 0x22, 0x39, 0x0a, 0x10,
	0x47, 0x65, 0x74, 0x53, 0x74, 0x6f, 0x72, 0x65, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65,
	0x12, 0x25, 0x0a, 0x05, 0x73, 0x74, 0x6f, 0x72, 0x65, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32,
	0x0f, 0x2e, 0x73, 0x74, 0x6f, 0x72, 0x65, 0x2e, 0x76, 0x31, 0x2e, 0x53, 0x74, 0x6f, 0x72, 0x65,
	0x52, 0x05, 0x73, 0x74, 0x6f, 0x72, 0x65, 0x22, 0x79, 0x0a, 0x12, 0x55, 0x70, 0x64, 0x61, 0x74,
	0x65, 0x53, 0x74, 0x6f, 0x72, 0x65, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x25, 0x0a,
	0x05, 0x73, 0x74, 0x6f, 0x72, 0x65, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x0f, 0x2e, 0x73,
	0x74, 0x6f, 0x72, 0x65, 0x2e, 0x76, 0x31, 0x2e, 0x53, 0x74, 0x6f, 0x72, 0x65, 0x52, 0x05, 0x73,
	0x74, 0x6f, 0x72, 0x65, 0x12, 0x29, 0x0a, 0x0e, 0x6c, 0x6f, 0x67, 0x6f, 0x5f, 0x72, 0x61, 0x77,
	0x5f, 0x69, 0x6d, 0x61, 0x67, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x0c, 0x48, 0x00, 0x52, 0x0c,
	0x6c, 0x6f, 0x67, 0x6f, 0x52, 0x61, 0x77, 0x49, 0x6d, 0x61, 0x67, 0x65, 0x88, 0x01, 0x01, 0x42,
	0x11, 0x0a, 0x0f, 0x5f, 0x6c, 0x6f, 0x67, 0x6f, 0x5f, 0x72, 0x61, 0x77, 0x5f, 0x69, 0x6d, 0x61,
	0x67, 0x65, 0x22, 0x3c, 0x0a, 0x13, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65, 0x53, 0x74, 0x6f, 0x72,
	0x65, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x25, 0x0a, 0x05, 0x73, 0x74, 0x6f,
	0x72, 0x65, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x0f, 0x2e, 0x73, 0x74, 0x6f, 0x72, 0x65,
	0x2e, 0x76, 0x31, 0x2e, 0x53, 0x74, 0x6f, 0x72, 0x65, 0x52, 0x05, 0x73, 0x74, 0x6f, 0x72, 0x65,
	0x22, 0x37, 0x0a, 0x12, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x53, 0x74, 0x6f, 0x72, 0x65, 0x52,
	0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x21, 0x0a, 0x06, 0x72, 0x65, 0x66, 0x5f, 0x69, 0x64,
	0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x42, 0x0a, 0xba, 0x48, 0x07, 0xc8, 0x01, 0x01, 0x72, 0x02,
	0x10, 0x03, 0x52, 0x05, 0x72, 0x65, 0x66, 0x49, 0x64, 0x22, 0x2f, 0x0a, 0x13, 0x44, 0x65, 0x6c,
	0x65, 0x74, 0x65, 0x53, 0x74, 0x6f, 0x72, 0x65, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65,
	0x12, 0x18, 0x0a, 0x07, 0x73, 0x75, 0x63, 0x63, 0x65, 0x73, 0x73, 0x18, 0x01, 0x20, 0x01, 0x28,
	0x08, 0x52, 0x07, 0x73, 0x75, 0x63, 0x63, 0x65, 0x73, 0x73, 0x32, 0xbd, 0x02, 0x0a, 0x0c, 0x53,
	0x74, 0x6f, 0x72, 0x65, 0x53, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x12, 0x4c, 0x0a, 0x0b, 0x43,
	0x72, 0x65, 0x61, 0x74, 0x65, 0x53, 0x74, 0x6f, 0x72, 0x65, 0x12, 0x1c, 0x2e, 0x73, 0x74, 0x6f,
	0x72, 0x65, 0x2e, 0x76, 0x31, 0x2e, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x53, 0x74, 0x6f, 0x72,
	0x65, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x1d, 0x2e, 0x73, 0x74, 0x6f, 0x72, 0x65,
	0x2e, 0x76, 0x31, 0x2e, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x53, 0x74, 0x6f, 0x72, 0x65, 0x52,
	0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x00, 0x12, 0x43, 0x0a, 0x08, 0x47, 0x65, 0x74,
	0x53, 0x74, 0x6f, 0x72, 0x65, 0x12, 0x19, 0x2e, 0x73, 0x74, 0x6f, 0x72, 0x65, 0x2e, 0x76, 0x31,
	0x2e, 0x47, 0x65, 0x74, 0x53, 0x74, 0x6f, 0x72, 0x65, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74,
	0x1a, 0x1a, 0x2e, 0x73, 0x74, 0x6f, 0x72, 0x65, 0x2e, 0x76, 0x31, 0x2e, 0x47, 0x65, 0x74, 0x53,
	0x74, 0x6f, 0x72, 0x65, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x00, 0x12, 0x4c,
	0x0a, 0x0b, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65, 0x53, 0x74, 0x6f, 0x72, 0x65, 0x12, 0x1c, 0x2e,
	0x73, 0x74, 0x6f, 0x72, 0x65, 0x2e, 0x76, 0x31, 0x2e, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65, 0x53,
	0x74, 0x6f, 0x72, 0x65, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x1d, 0x2e, 0x73, 0x74,
	0x6f, 0x72, 0x65, 0x2e, 0x76, 0x31, 0x2e, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65, 0x53, 0x74, 0x6f,
	0x72, 0x65, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x00, 0x12, 0x4c, 0x0a, 0x0b,
	0x44, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x53, 0x74, 0x6f, 0x72, 0x65, 0x12, 0x1c, 0x2e, 0x73, 0x74,
	0x6f, 0x72, 0x65, 0x2e, 0x76, 0x31, 0x2e, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x53, 0x74, 0x6f,
	0x72, 0x65, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x1d, 0x2e, 0x73, 0x74, 0x6f, 0x72,
	0x65, 0x2e, 0x76, 0x31, 0x2e, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x53, 0x74, 0x6f, 0x72, 0x65,
	0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x00, 0x42, 0x99, 0x01, 0x0a, 0x0c, 0x63,
	0x6f, 0x6d, 0x2e, 0x73, 0x74, 0x6f, 0x72, 0x65, 0x2e, 0x76, 0x31, 0x42, 0x0a, 0x53, 0x74, 0x6f,
	0x72, 0x65, 0x50, 0x72, 0x6f, 0x74, 0x6f, 0x50, 0x01, 0x5a, 0x3c, 0x67, 0x69, 0x74, 0x68, 0x75,
	0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x6b, 0x61, 0x72, 0x69, 0x62, 0x75, 0x2d, 0x63, 0x61, 0x70,
	0x2f, 0x73, 0x61, 0x62, 0x69, 0x74, 0x6f, 0x75, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x73, 0x2f,
	0x67, 0x65, 0x6e, 0x2f, 0x67, 0x6f, 0x2f, 0x73, 0x74, 0x6f, 0x72, 0x65, 0x2f, 0x76, 0x31, 0x3b,
	0x73, 0x74, 0x6f, 0x72, 0x65, 0x76, 0x31, 0xa2, 0x02, 0x03, 0x53, 0x58, 0x58, 0xaa, 0x02, 0x08,
	0x53, 0x74, 0x6f, 0x72, 0x65, 0x2e, 0x56, 0x31, 0xca, 0x02, 0x08, 0x53, 0x74, 0x6f, 0x72, 0x65,
	0x5c, 0x56, 0x31, 0xe2, 0x02, 0x14, 0x53, 0x74, 0x6f, 0x72, 0x65, 0x5c, 0x56, 0x31, 0x5c, 0x47,
	0x50, 0x42, 0x4d, 0x65, 0x74, 0x61, 0x64, 0x61, 0x74, 0x61, 0xea, 0x02, 0x09, 0x53, 0x74, 0x6f,
	0x72, 0x65, 0x3a, 0x3a, 0x56, 0x31, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
})

var (
	file_store_v1_store_proto_rawDescOnce sync.Once
	file_store_v1_store_proto_rawDescData []byte
)

func file_store_v1_store_proto_rawDescGZIP() []byte {
	file_store_v1_store_proto_rawDescOnce.Do(func() {
		file_store_v1_store_proto_rawDescData = protoimpl.X.CompressGZIP(unsafe.Slice(unsafe.StringData(file_store_v1_store_proto_rawDesc), len(file_store_v1_store_proto_rawDesc)))
	})
	return file_store_v1_store_proto_rawDescData
}

var file_store_v1_store_proto_msgTypes = make([]protoimpl.MessageInfo, 9)
var file_store_v1_store_proto_goTypes = []any{
	(*Store)(nil),               // 0: store.v1.Store
	(*CreateStoreRequest)(nil),  // 1: store.v1.CreateStoreRequest
	(*CreateStoreResponse)(nil), // 2: store.v1.CreateStoreResponse
	(*GetStoreRequest)(nil),     // 3: store.v1.GetStoreRequest
	(*GetStoreResponse)(nil),    // 4: store.v1.GetStoreResponse
	(*UpdateStoreRequest)(nil),  // 5: store.v1.UpdateStoreRequest
	(*UpdateStoreResponse)(nil), // 6: store.v1.UpdateStoreResponse
	(*DeleteStoreRequest)(nil),  // 7: store.v1.DeleteStoreRequest
	(*DeleteStoreResponse)(nil), // 8: store.v1.DeleteStoreResponse
}
var file_store_v1_store_proto_depIdxs = []int32{
	0, // 0: store.v1.CreateStoreRequest.store:type_name -> store.v1.Store
	0, // 1: store.v1.GetStoreResponse.store:type_name -> store.v1.Store
	0, // 2: store.v1.UpdateStoreRequest.store:type_name -> store.v1.Store
	0, // 3: store.v1.UpdateStoreResponse.store:type_name -> store.v1.Store
	1, // 4: store.v1.StoreService.CreateStore:input_type -> store.v1.CreateStoreRequest
	3, // 5: store.v1.StoreService.GetStore:input_type -> store.v1.GetStoreRequest
	5, // 6: store.v1.StoreService.UpdateStore:input_type -> store.v1.UpdateStoreRequest
	7, // 7: store.v1.StoreService.DeleteStore:input_type -> store.v1.DeleteStoreRequest
	2, // 8: store.v1.StoreService.CreateStore:output_type -> store.v1.CreateStoreResponse
	4, // 9: store.v1.StoreService.GetStore:output_type -> store.v1.GetStoreResponse
	6, // 10: store.v1.StoreService.UpdateStore:output_type -> store.v1.UpdateStoreResponse
	8, // 11: store.v1.StoreService.DeleteStore:output_type -> store.v1.DeleteStoreResponse
	8, // [8:12] is the sub-list for method output_type
	4, // [4:8] is the sub-list for method input_type
	4, // [4:4] is the sub-list for extension type_name
	4, // [4:4] is the sub-list for extension extendee
	0, // [0:4] is the sub-list for field type_name
}

func init() { file_store_v1_store_proto_init() }
func file_store_v1_store_proto_init() {
	if File_store_v1_store_proto != nil {
		return
	}
	file_store_v1_store_proto_msgTypes[0].OneofWrappers = []any{}
	file_store_v1_store_proto_msgTypes[1].OneofWrappers = []any{}
	file_store_v1_store_proto_msgTypes[5].OneofWrappers = []any{}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: unsafe.Slice(unsafe.StringData(file_store_v1_store_proto_rawDesc), len(file_store_v1_store_proto_rawDesc)),
			NumEnums:      0,
			NumMessages:   9,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_store_v1_store_proto_goTypes,
		DependencyIndexes: file_store_v1_store_proto_depIdxs,
		MessageInfos:      file_store_v1_store_proto_msgTypes,
	}.Build()
	File_store_v1_store_proto = out.File
	file_store_v1_store_proto_goTypes = nil
	file_store_v1_store_proto_depIdxs = nil
}
