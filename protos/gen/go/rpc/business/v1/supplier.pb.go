// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.36.5
// 	protoc        (unknown)
// source: business/v1/supplier.proto

package businessv1

import (
	_ "buf.build/gen/go/bufbuild/protovalidate/protocolbuffers/go/buf/validate"
	v1 "github.com/karibu-cap/sabitou/protos/gen/go/rpc/link/v1"
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

type Link struct {
	state protoimpl.MessageState `protogen:"open.v1"`
	// The label of the link.
	Label string `protobuf:"bytes,1,opt,name=label,proto3" json:"label,omitempty"`
	// The url of the link.
	// Todo: We must automatically retrieve the icon of the link.
	Url           string `protobuf:"bytes,2,opt,name=url,proto3" json:"url,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *Link) Reset() {
	*x = Link{}
	mi := &file_business_v1_supplier_proto_msgTypes[0]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *Link) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Link) ProtoMessage() {}

func (x *Link) ProtoReflect() protoreflect.Message {
	mi := &file_business_v1_supplier_proto_msgTypes[0]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Link.ProtoReflect.Descriptor instead.
func (*Link) Descriptor() ([]byte, []int) {
	return file_business_v1_supplier_proto_rawDescGZIP(), []int{0}
}

func (x *Link) GetLabel() string {
	if x != nil {
		return x.Label
	}
	return ""
}

func (x *Link) GetUrl() string {
	if x != nil {
		return x.Url
	}
	return ""
}

type Supplier struct {
	state protoimpl.MessageState `protogen:"open.v1"`
	// The reference id to the supplier identifier.
	RefId *string `protobuf:"bytes,1,opt,name=ref_id,json=refId,proto3,oneof" json:"ref_id,omitempty"`
	// The name of the supplier.
	Name string `protobuf:"bytes,2,opt,name=name,proto3" json:"name,omitempty"`
	// The description of the supplier.
	Description *string `protobuf:"bytes,3,opt,name=description,proto3,oneof" json:"description,omitempty"`
	// The id of the media of the logo of the supplier.
	LogoLinkId *string `protobuf:"bytes,4,opt,name=logo_link_id,json=logoLinkId,proto3,oneof" json:"logo_link_id,omitempty"`
	// The links of the supplier.
	ExternalLinksIds []string `protobuf:"bytes,5,rep,name=external_links_ids,json=externalLinksIds,proto3" json:"external_links_ids,omitempty"`
	// The id of the business of the supplier.
	BusinessId    string `protobuf:"bytes,6,opt,name=business_id,json=businessId,proto3" json:"business_id,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *Supplier) Reset() {
	*x = Supplier{}
	mi := &file_business_v1_supplier_proto_msgTypes[1]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *Supplier) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Supplier) ProtoMessage() {}

func (x *Supplier) ProtoReflect() protoreflect.Message {
	mi := &file_business_v1_supplier_proto_msgTypes[1]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Supplier.ProtoReflect.Descriptor instead.
func (*Supplier) Descriptor() ([]byte, []int) {
	return file_business_v1_supplier_proto_rawDescGZIP(), []int{1}
}

func (x *Supplier) GetRefId() string {
	if x != nil && x.RefId != nil {
		return *x.RefId
	}
	return ""
}

func (x *Supplier) GetName() string {
	if x != nil {
		return x.Name
	}
	return ""
}

func (x *Supplier) GetDescription() string {
	if x != nil && x.Description != nil {
		return *x.Description
	}
	return ""
}

func (x *Supplier) GetLogoLinkId() string {
	if x != nil && x.LogoLinkId != nil {
		return *x.LogoLinkId
	}
	return ""
}

func (x *Supplier) GetExternalLinksIds() []string {
	if x != nil {
		return x.ExternalLinksIds
	}
	return nil
}

func (x *Supplier) GetBusinessId() string {
	if x != nil {
		return x.BusinessId
	}
	return ""
}

type CreateSupplierRequest struct {
	state protoimpl.MessageState `protogen:"open.v1"`
	// The supplier information to create.
	Supplier *Supplier `protobuf:"bytes,1,opt,name=supplier,proto3" json:"supplier,omitempty"`
	// The raw image of the logo of the supplier.
	LogoRawImage []byte `protobuf:"bytes,2,opt,name=logo_raw_image,json=logoRawImage,proto3,oneof" json:"logo_raw_image,omitempty"`
	// The links of the supplier.
	ExternalLinks []*v1.ResourceLink `protobuf:"bytes,3,rep,name=external_links,json=externalLinks,proto3" json:"external_links,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *CreateSupplierRequest) Reset() {
	*x = CreateSupplierRequest{}
	mi := &file_business_v1_supplier_proto_msgTypes[2]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *CreateSupplierRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateSupplierRequest) ProtoMessage() {}

func (x *CreateSupplierRequest) ProtoReflect() protoreflect.Message {
	mi := &file_business_v1_supplier_proto_msgTypes[2]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateSupplierRequest.ProtoReflect.Descriptor instead.
func (*CreateSupplierRequest) Descriptor() ([]byte, []int) {
	return file_business_v1_supplier_proto_rawDescGZIP(), []int{2}
}

func (x *CreateSupplierRequest) GetSupplier() *Supplier {
	if x != nil {
		return x.Supplier
	}
	return nil
}

func (x *CreateSupplierRequest) GetLogoRawImage() []byte {
	if x != nil {
		return x.LogoRawImage
	}
	return nil
}

func (x *CreateSupplierRequest) GetExternalLinks() []*v1.ResourceLink {
	if x != nil {
		return x.ExternalLinks
	}
	return nil
}

type CreateSupplierResponse struct {
	state protoimpl.MessageState `protogen:"open.v1"`
	// The reference id to the supplier identifier.
	SuplierId     string `protobuf:"bytes,1,opt,name=suplier_id,json=suplierId,proto3" json:"suplier_id,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *CreateSupplierResponse) Reset() {
	*x = CreateSupplierResponse{}
	mi := &file_business_v1_supplier_proto_msgTypes[3]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *CreateSupplierResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateSupplierResponse) ProtoMessage() {}

func (x *CreateSupplierResponse) ProtoReflect() protoreflect.Message {
	mi := &file_business_v1_supplier_proto_msgTypes[3]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateSupplierResponse.ProtoReflect.Descriptor instead.
func (*CreateSupplierResponse) Descriptor() ([]byte, []int) {
	return file_business_v1_supplier_proto_rawDescGZIP(), []int{3}
}

func (x *CreateSupplierResponse) GetSuplierId() string {
	if x != nil {
		return x.SuplierId
	}
	return ""
}

type GetSupplierRequest struct {
	state protoimpl.MessageState `protogen:"open.v1"`
	// The reference id to the supplier identifier.
	SupplierId    string `protobuf:"bytes,1,opt,name=supplier_id,json=supplierId,proto3" json:"supplier_id,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *GetSupplierRequest) Reset() {
	*x = GetSupplierRequest{}
	mi := &file_business_v1_supplier_proto_msgTypes[4]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *GetSupplierRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetSupplierRequest) ProtoMessage() {}

func (x *GetSupplierRequest) ProtoReflect() protoreflect.Message {
	mi := &file_business_v1_supplier_proto_msgTypes[4]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetSupplierRequest.ProtoReflect.Descriptor instead.
func (*GetSupplierRequest) Descriptor() ([]byte, []int) {
	return file_business_v1_supplier_proto_rawDescGZIP(), []int{4}
}

func (x *GetSupplierRequest) GetSupplierId() string {
	if x != nil {
		return x.SupplierId
	}
	return ""
}

type GetSupplierResponse struct {
	state protoimpl.MessageState `protogen:"open.v1"`
	// The retrieved supplier data.
	Supplier      *Supplier `protobuf:"bytes,1,opt,name=supplier,proto3" json:"supplier,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *GetSupplierResponse) Reset() {
	*x = GetSupplierResponse{}
	mi := &file_business_v1_supplier_proto_msgTypes[5]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *GetSupplierResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetSupplierResponse) ProtoMessage() {}

func (x *GetSupplierResponse) ProtoReflect() protoreflect.Message {
	mi := &file_business_v1_supplier_proto_msgTypes[5]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetSupplierResponse.ProtoReflect.Descriptor instead.
func (*GetSupplierResponse) Descriptor() ([]byte, []int) {
	return file_business_v1_supplier_proto_rawDescGZIP(), []int{5}
}

func (x *GetSupplierResponse) GetSupplier() *Supplier {
	if x != nil {
		return x.Supplier
	}
	return nil
}

type GetBusinessSuppliersRequest struct {
	state protoimpl.MessageState `protogen:"open.v1"`
	// The reference id to the supplier identifier.
	SupplierId    string `protobuf:"bytes,1,opt,name=supplier_id,json=supplierId,proto3" json:"supplier_id,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *GetBusinessSuppliersRequest) Reset() {
	*x = GetBusinessSuppliersRequest{}
	mi := &file_business_v1_supplier_proto_msgTypes[6]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *GetBusinessSuppliersRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetBusinessSuppliersRequest) ProtoMessage() {}

func (x *GetBusinessSuppliersRequest) ProtoReflect() protoreflect.Message {
	mi := &file_business_v1_supplier_proto_msgTypes[6]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetBusinessSuppliersRequest.ProtoReflect.Descriptor instead.
func (*GetBusinessSuppliersRequest) Descriptor() ([]byte, []int) {
	return file_business_v1_supplier_proto_rawDescGZIP(), []int{6}
}

func (x *GetBusinessSuppliersRequest) GetSupplierId() string {
	if x != nil {
		return x.SupplierId
	}
	return ""
}

type GetBusinessSuppliersResponse struct {
	state protoimpl.MessageState `protogen:"open.v1"`
	// The list of suppliers of the business.
	// Note: Only the ids and names of the suppliers are returned.
	Suppliers     []*Supplier `protobuf:"bytes,1,rep,name=suppliers,proto3" json:"suppliers,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *GetBusinessSuppliersResponse) Reset() {
	*x = GetBusinessSuppliersResponse{}
	mi := &file_business_v1_supplier_proto_msgTypes[7]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *GetBusinessSuppliersResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetBusinessSuppliersResponse) ProtoMessage() {}

func (x *GetBusinessSuppliersResponse) ProtoReflect() protoreflect.Message {
	mi := &file_business_v1_supplier_proto_msgTypes[7]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetBusinessSuppliersResponse.ProtoReflect.Descriptor instead.
func (*GetBusinessSuppliersResponse) Descriptor() ([]byte, []int) {
	return file_business_v1_supplier_proto_rawDescGZIP(), []int{7}
}

func (x *GetBusinessSuppliersResponse) GetSuppliers() []*Supplier {
	if x != nil {
		return x.Suppliers
	}
	return nil
}

type UpdateSupplierRequest struct {
	state protoimpl.MessageState `protogen:"open.v1"`
	// The supplier information to update.
	// Note:Only the fields that are set will be updated.
	Supplier *Supplier `protobuf:"bytes,1,opt,name=supplier,proto3" json:"supplier,omitempty"`
	// The raw image of the logo of the supplier.
	LogoRawImage []byte `protobuf:"bytes,2,opt,name=logo_raw_image,json=logoRawImage,proto3,oneof" json:"logo_raw_image,omitempty"`
	// The links of the supplier.
	ExternalLinks []*v1.ResourceLink `protobuf:"bytes,3,rep,name=external_links,json=externalLinks,proto3" json:"external_links,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *UpdateSupplierRequest) Reset() {
	*x = UpdateSupplierRequest{}
	mi := &file_business_v1_supplier_proto_msgTypes[8]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *UpdateSupplierRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*UpdateSupplierRequest) ProtoMessage() {}

func (x *UpdateSupplierRequest) ProtoReflect() protoreflect.Message {
	mi := &file_business_v1_supplier_proto_msgTypes[8]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use UpdateSupplierRequest.ProtoReflect.Descriptor instead.
func (*UpdateSupplierRequest) Descriptor() ([]byte, []int) {
	return file_business_v1_supplier_proto_rawDescGZIP(), []int{8}
}

func (x *UpdateSupplierRequest) GetSupplier() *Supplier {
	if x != nil {
		return x.Supplier
	}
	return nil
}

func (x *UpdateSupplierRequest) GetLogoRawImage() []byte {
	if x != nil {
		return x.LogoRawImage
	}
	return nil
}

func (x *UpdateSupplierRequest) GetExternalLinks() []*v1.ResourceLink {
	if x != nil {
		return x.ExternalLinks
	}
	return nil
}

type UpdateSupplierResponse struct {
	state protoimpl.MessageState `protogen:"open.v1"`
	// The updated supplier data.
	Supplier      *Supplier `protobuf:"bytes,1,opt,name=supplier,proto3" json:"supplier,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *UpdateSupplierResponse) Reset() {
	*x = UpdateSupplierResponse{}
	mi := &file_business_v1_supplier_proto_msgTypes[9]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *UpdateSupplierResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*UpdateSupplierResponse) ProtoMessage() {}

func (x *UpdateSupplierResponse) ProtoReflect() protoreflect.Message {
	mi := &file_business_v1_supplier_proto_msgTypes[9]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use UpdateSupplierResponse.ProtoReflect.Descriptor instead.
func (*UpdateSupplierResponse) Descriptor() ([]byte, []int) {
	return file_business_v1_supplier_proto_rawDescGZIP(), []int{9}
}

func (x *UpdateSupplierResponse) GetSupplier() *Supplier {
	if x != nil {
		return x.Supplier
	}
	return nil
}

type DeleteSupplierRequest struct {
	state protoimpl.MessageState `protogen:"open.v1"`
	// The reference id to the supplier identifier.
	SupplierId    string `protobuf:"bytes,1,opt,name=supplier_id,json=supplierId,proto3" json:"supplier_id,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *DeleteSupplierRequest) Reset() {
	*x = DeleteSupplierRequest{}
	mi := &file_business_v1_supplier_proto_msgTypes[10]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *DeleteSupplierRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DeleteSupplierRequest) ProtoMessage() {}

func (x *DeleteSupplierRequest) ProtoReflect() protoreflect.Message {
	mi := &file_business_v1_supplier_proto_msgTypes[10]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DeleteSupplierRequest.ProtoReflect.Descriptor instead.
func (*DeleteSupplierRequest) Descriptor() ([]byte, []int) {
	return file_business_v1_supplier_proto_rawDescGZIP(), []int{10}
}

func (x *DeleteSupplierRequest) GetSupplierId() string {
	if x != nil {
		return x.SupplierId
	}
	return ""
}

type DeleteSupplierResponse struct {
	state protoimpl.MessageState `protogen:"open.v1"`
	// Whether the supplier was successfully deleted.
	Success       bool `protobuf:"varint,1,opt,name=success,proto3" json:"success,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *DeleteSupplierResponse) Reset() {
	*x = DeleteSupplierResponse{}
	mi := &file_business_v1_supplier_proto_msgTypes[11]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *DeleteSupplierResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DeleteSupplierResponse) ProtoMessage() {}

func (x *DeleteSupplierResponse) ProtoReflect() protoreflect.Message {
	mi := &file_business_v1_supplier_proto_msgTypes[11]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DeleteSupplierResponse.ProtoReflect.Descriptor instead.
func (*DeleteSupplierResponse) Descriptor() ([]byte, []int) {
	return file_business_v1_supplier_proto_rawDescGZIP(), []int{11}
}

func (x *DeleteSupplierResponse) GetSuccess() bool {
	if x != nil {
		return x.Success
	}
	return false
}

var File_business_v1_supplier_proto protoreflect.FileDescriptor

var file_business_v1_supplier_proto_rawDesc = string([]byte{
	0x0a, 0x1a, 0x62, 0x75, 0x73, 0x69, 0x6e, 0x65, 0x73, 0x73, 0x2f, 0x76, 0x31, 0x2f, 0x73, 0x75,
	0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x0b, 0x62, 0x75,
	0x73, 0x69, 0x6e, 0x65, 0x73, 0x73, 0x2e, 0x76, 0x31, 0x1a, 0x1b, 0x62, 0x75, 0x66, 0x2f, 0x76,
	0x61, 0x6c, 0x69, 0x64, 0x61, 0x74, 0x65, 0x2f, 0x76, 0x61, 0x6c, 0x69, 0x64, 0x61, 0x74, 0x65,
	0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x12, 0x6c, 0x69, 0x6e, 0x6b, 0x2f, 0x76, 0x31, 0x2f,
	0x6c, 0x69, 0x6e, 0x6b, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0x2e, 0x0a, 0x04, 0x4c, 0x69,
	0x6e, 0x6b, 0x12, 0x14, 0x0a, 0x05, 0x6c, 0x61, 0x62, 0x65, 0x6c, 0x18, 0x01, 0x20, 0x01, 0x28,
	0x09, 0x52, 0x05, 0x6c, 0x61, 0x62, 0x65, 0x6c, 0x12, 0x10, 0x0a, 0x03, 0x75, 0x72, 0x6c, 0x18,
	0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x03, 0x75, 0x72, 0x6c, 0x22, 0x8f, 0x02, 0x0a, 0x08, 0x53,
	0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x12, 0x1a, 0x0a, 0x06, 0x72, 0x65, 0x66, 0x5f, 0x69,
	0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x48, 0x00, 0x52, 0x05, 0x72, 0x65, 0x66, 0x49, 0x64,
	0x88, 0x01, 0x01, 0x12, 0x12, 0x0a, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28,
	0x09, 0x52, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x12, 0x25, 0x0a, 0x0b, 0x64, 0x65, 0x73, 0x63, 0x72,
	0x69, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x48, 0x01, 0x52, 0x0b,
	0x64, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x88, 0x01, 0x01, 0x12, 0x25,
	0x0a, 0x0c, 0x6c, 0x6f, 0x67, 0x6f, 0x5f, 0x6c, 0x69, 0x6e, 0x6b, 0x5f, 0x69, 0x64, 0x18, 0x04,
	0x20, 0x01, 0x28, 0x09, 0x48, 0x02, 0x52, 0x0a, 0x6c, 0x6f, 0x67, 0x6f, 0x4c, 0x69, 0x6e, 0x6b,
	0x49, 0x64, 0x88, 0x01, 0x01, 0x12, 0x2c, 0x0a, 0x12, 0x65, 0x78, 0x74, 0x65, 0x72, 0x6e, 0x61,
	0x6c, 0x5f, 0x6c, 0x69, 0x6e, 0x6b, 0x73, 0x5f, 0x69, 0x64, 0x73, 0x18, 0x05, 0x20, 0x03, 0x28,
	0x09, 0x52, 0x10, 0x65, 0x78, 0x74, 0x65, 0x72, 0x6e, 0x61, 0x6c, 0x4c, 0x69, 0x6e, 0x6b, 0x73,
	0x49, 0x64, 0x73, 0x12, 0x2b, 0x0a, 0x0b, 0x62, 0x75, 0x73, 0x69, 0x6e, 0x65, 0x73, 0x73, 0x5f,
	0x69, 0x64, 0x18, 0x06, 0x20, 0x01, 0x28, 0x09, 0x42, 0x0a, 0xba, 0x48, 0x07, 0xc8, 0x01, 0x01,
	0x72, 0x02, 0x10, 0x03, 0x52, 0x0a, 0x62, 0x75, 0x73, 0x69, 0x6e, 0x65, 0x73, 0x73, 0x49, 0x64,
	0x42, 0x09, 0x0a, 0x07, 0x5f, 0x72, 0x65, 0x66, 0x5f, 0x69, 0x64, 0x42, 0x0e, 0x0a, 0x0c, 0x5f,
	0x64, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x42, 0x0f, 0x0a, 0x0d, 0x5f,
	0x6c, 0x6f, 0x67, 0x6f, 0x5f, 0x6c, 0x69, 0x6e, 0x6b, 0x5f, 0x69, 0x64, 0x22, 0xc6, 0x01, 0x0a,
	0x15, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x53, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x52,
	0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x31, 0x0a, 0x08, 0x73, 0x75, 0x70, 0x70, 0x6c, 0x69,
	0x65, 0x72, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x15, 0x2e, 0x62, 0x75, 0x73, 0x69, 0x6e,
	0x65, 0x73, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x53, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x52,
	0x08, 0x73, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x12, 0x29, 0x0a, 0x0e, 0x6c, 0x6f, 0x67,
	0x6f, 0x5f, 0x72, 0x61, 0x77, 0x5f, 0x69, 0x6d, 0x61, 0x67, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28,
	0x0c, 0x48, 0x00, 0x52, 0x0c, 0x6c, 0x6f, 0x67, 0x6f, 0x52, 0x61, 0x77, 0x49, 0x6d, 0x61, 0x67,
	0x65, 0x88, 0x01, 0x01, 0x12, 0x3c, 0x0a, 0x0e, 0x65, 0x78, 0x74, 0x65, 0x72, 0x6e, 0x61, 0x6c,
	0x5f, 0x6c, 0x69, 0x6e, 0x6b, 0x73, 0x18, 0x03, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x15, 0x2e, 0x6c,
	0x69, 0x6e, 0x6b, 0x2e, 0x76, 0x31, 0x2e, 0x52, 0x65, 0x73, 0x6f, 0x75, 0x72, 0x63, 0x65, 0x4c,
	0x69, 0x6e, 0x6b, 0x52, 0x0d, 0x65, 0x78, 0x74, 0x65, 0x72, 0x6e, 0x61, 0x6c, 0x4c, 0x69, 0x6e,
	0x6b, 0x73, 0x42, 0x11, 0x0a, 0x0f, 0x5f, 0x6c, 0x6f, 0x67, 0x6f, 0x5f, 0x72, 0x61, 0x77, 0x5f,
	0x69, 0x6d, 0x61, 0x67, 0x65, 0x22, 0x43, 0x0a, 0x16, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x53,
	0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12,
	0x29, 0x0a, 0x0a, 0x73, 0x75, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20,
	0x01, 0x28, 0x09, 0x42, 0x0a, 0xba, 0x48, 0x07, 0xc8, 0x01, 0x01, 0x72, 0x02, 0x10, 0x03, 0x52,
	0x09, 0x73, 0x75, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x49, 0x64, 0x22, 0x41, 0x0a, 0x12, 0x47, 0x65,
	0x74, 0x53, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74,
	0x12, 0x2b, 0x0a, 0x0b, 0x73, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x5f, 0x69, 0x64, 0x18,
	0x01, 0x20, 0x01, 0x28, 0x09, 0x42, 0x0a, 0xba, 0x48, 0x07, 0xc8, 0x01, 0x01, 0x72, 0x02, 0x10,
	0x03, 0x52, 0x0a, 0x73, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x49, 0x64, 0x22, 0x48, 0x0a,
	0x13, 0x47, 0x65, 0x74, 0x53, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x52, 0x65, 0x73, 0x70,
	0x6f, 0x6e, 0x73, 0x65, 0x12, 0x31, 0x0a, 0x08, 0x73, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72,
	0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x15, 0x2e, 0x62, 0x75, 0x73, 0x69, 0x6e, 0x65, 0x73,
	0x73, 0x2e, 0x76, 0x31, 0x2e, 0x53, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x52, 0x08, 0x73,
	0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x22, 0x4a, 0x0a, 0x1b, 0x47, 0x65, 0x74, 0x42, 0x75,
	0x73, 0x69, 0x6e, 0x65, 0x73, 0x73, 0x53, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x73, 0x52,
	0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x2b, 0x0a, 0x0b, 0x73, 0x75, 0x70, 0x70, 0x6c, 0x69,
	0x65, 0x72, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x42, 0x0a, 0xba, 0x48, 0x07,
	0xc8, 0x01, 0x01, 0x72, 0x02, 0x10, 0x03, 0x52, 0x0a, 0x73, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65,
	0x72, 0x49, 0x64, 0x22, 0x53, 0x0a, 0x1c, 0x47, 0x65, 0x74, 0x42, 0x75, 0x73, 0x69, 0x6e, 0x65,
	0x73, 0x73, 0x53, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x73, 0x52, 0x65, 0x73, 0x70, 0x6f,
	0x6e, 0x73, 0x65, 0x12, 0x33, 0x0a, 0x09, 0x73, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x73,
	0x18, 0x01, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x15, 0x2e, 0x62, 0x75, 0x73, 0x69, 0x6e, 0x65, 0x73,
	0x73, 0x2e, 0x76, 0x31, 0x2e, 0x53, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x52, 0x09, 0x73,
	0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x73, 0x22, 0xc6, 0x01, 0x0a, 0x15, 0x55, 0x70, 0x64,
	0x61, 0x74, 0x65, 0x53, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x52, 0x65, 0x71, 0x75, 0x65,
	0x73, 0x74, 0x12, 0x31, 0x0a, 0x08, 0x73, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x18, 0x01,
	0x20, 0x01, 0x28, 0x0b, 0x32, 0x15, 0x2e, 0x62, 0x75, 0x73, 0x69, 0x6e, 0x65, 0x73, 0x73, 0x2e,
	0x76, 0x31, 0x2e, 0x53, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x52, 0x08, 0x73, 0x75, 0x70,
	0x70, 0x6c, 0x69, 0x65, 0x72, 0x12, 0x29, 0x0a, 0x0e, 0x6c, 0x6f, 0x67, 0x6f, 0x5f, 0x72, 0x61,
	0x77, 0x5f, 0x69, 0x6d, 0x61, 0x67, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x0c, 0x48, 0x00, 0x52,
	0x0c, 0x6c, 0x6f, 0x67, 0x6f, 0x52, 0x61, 0x77, 0x49, 0x6d, 0x61, 0x67, 0x65, 0x88, 0x01, 0x01,
	0x12, 0x3c, 0x0a, 0x0e, 0x65, 0x78, 0x74, 0x65, 0x72, 0x6e, 0x61, 0x6c, 0x5f, 0x6c, 0x69, 0x6e,
	0x6b, 0x73, 0x18, 0x03, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x15, 0x2e, 0x6c, 0x69, 0x6e, 0x6b, 0x2e,
	0x76, 0x31, 0x2e, 0x52, 0x65, 0x73, 0x6f, 0x75, 0x72, 0x63, 0x65, 0x4c, 0x69, 0x6e, 0x6b, 0x52,
	0x0d, 0x65, 0x78, 0x74, 0x65, 0x72, 0x6e, 0x61, 0x6c, 0x4c, 0x69, 0x6e, 0x6b, 0x73, 0x42, 0x11,
	0x0a, 0x0f, 0x5f, 0x6c, 0x6f, 0x67, 0x6f, 0x5f, 0x72, 0x61, 0x77, 0x5f, 0x69, 0x6d, 0x61, 0x67,
	0x65, 0x22, 0x4b, 0x0a, 0x16, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65, 0x53, 0x75, 0x70, 0x70, 0x6c,
	0x69, 0x65, 0x72, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x31, 0x0a, 0x08, 0x73,
	0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x15, 0x2e,
	0x62, 0x75, 0x73, 0x69, 0x6e, 0x65, 0x73, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x53, 0x75, 0x70, 0x70,
	0x6c, 0x69, 0x65, 0x72, 0x52, 0x08, 0x73, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x22, 0x44,
	0x0a, 0x15, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x53, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72,
	0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x2b, 0x0a, 0x0b, 0x73, 0x75, 0x70, 0x70, 0x6c,
	0x69, 0x65, 0x72, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x42, 0x0a, 0xba, 0x48,
	0x07, 0xc8, 0x01, 0x01, 0x72, 0x02, 0x10, 0x03, 0x52, 0x0a, 0x73, 0x75, 0x70, 0x70, 0x6c, 0x69,
	0x65, 0x72, 0x49, 0x64, 0x22, 0x32, 0x0a, 0x16, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x53, 0x75,
	0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x18,
	0x0a, 0x07, 0x73, 0x75, 0x63, 0x63, 0x65, 0x73, 0x73, 0x18, 0x01, 0x20, 0x01, 0x28, 0x08, 0x52,
	0x07, 0x73, 0x75, 0x63, 0x63, 0x65, 0x73, 0x73, 0x32, 0xe1, 0x03, 0x0a, 0x0f, 0x53, 0x75, 0x70,
	0x70, 0x6c, 0x69, 0x65, 0x72, 0x53, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x12, 0x59, 0x0a, 0x0e,
	0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x53, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x12, 0x22,
	0x2e, 0x62, 0x75, 0x73, 0x69, 0x6e, 0x65, 0x73, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x43, 0x72, 0x65,
	0x61, 0x74, 0x65, 0x53, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x52, 0x65, 0x71, 0x75, 0x65,
	0x73, 0x74, 0x1a, 0x23, 0x2e, 0x62, 0x75, 0x73, 0x69, 0x6e, 0x65, 0x73, 0x73, 0x2e, 0x76, 0x31,
	0x2e, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x53, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x52,
	0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x50, 0x0a, 0x0b, 0x47, 0x65, 0x74, 0x53, 0x75,
	0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x12, 0x1f, 0x2e, 0x62, 0x75, 0x73, 0x69, 0x6e, 0x65, 0x73,
	0x73, 0x2e, 0x76, 0x31, 0x2e, 0x47, 0x65, 0x74, 0x53, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72,
	0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x20, 0x2e, 0x62, 0x75, 0x73, 0x69, 0x6e, 0x65,
	0x73, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x47, 0x65, 0x74, 0x53, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65,
	0x72, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x6b, 0x0a, 0x14, 0x47, 0x65, 0x74,
	0x42, 0x75, 0x73, 0x69, 0x6e, 0x65, 0x73, 0x73, 0x53, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72,
	0x73, 0x12, 0x28, 0x2e, 0x62, 0x75, 0x73, 0x69, 0x6e, 0x65, 0x73, 0x73, 0x2e, 0x76, 0x31, 0x2e,
	0x47, 0x65, 0x74, 0x42, 0x75, 0x73, 0x69, 0x6e, 0x65, 0x73, 0x73, 0x53, 0x75, 0x70, 0x70, 0x6c,
	0x69, 0x65, 0x72, 0x73, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x29, 0x2e, 0x62, 0x75,
	0x73, 0x69, 0x6e, 0x65, 0x73, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x47, 0x65, 0x74, 0x42, 0x75, 0x73,
	0x69, 0x6e, 0x65, 0x73, 0x73, 0x53, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x73, 0x52, 0x65,
	0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x59, 0x0a, 0x0e, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65,
	0x53, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x12, 0x22, 0x2e, 0x62, 0x75, 0x73, 0x69, 0x6e,
	0x65, 0x73, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65, 0x53, 0x75, 0x70,
	0x70, 0x6c, 0x69, 0x65, 0x72, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x23, 0x2e, 0x62,
	0x75, 0x73, 0x69, 0x6e, 0x65, 0x73, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x55, 0x70, 0x64, 0x61, 0x74,
	0x65, 0x53, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73,
	0x65, 0x12, 0x59, 0x0a, 0x0e, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x53, 0x75, 0x70, 0x70, 0x6c,
	0x69, 0x65, 0x72, 0x12, 0x22, 0x2e, 0x62, 0x75, 0x73, 0x69, 0x6e, 0x65, 0x73, 0x73, 0x2e, 0x76,
	0x31, 0x2e, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x53, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72,
	0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x23, 0x2e, 0x62, 0x75, 0x73, 0x69, 0x6e, 0x65,
	0x73, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x53, 0x75, 0x70, 0x70,
	0x6c, 0x69, 0x65, 0x72, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x42, 0xb5, 0x01, 0x0a,
	0x0f, 0x63, 0x6f, 0x6d, 0x2e, 0x62, 0x75, 0x73, 0x69, 0x6e, 0x65, 0x73, 0x73, 0x2e, 0x76, 0x31,
	0x42, 0x0d, 0x53, 0x75, 0x70, 0x70, 0x6c, 0x69, 0x65, 0x72, 0x50, 0x72, 0x6f, 0x74, 0x6f, 0x50,
	0x01, 0x5a, 0x46, 0x67, 0x69, 0x74, 0x68, 0x75, 0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x6b, 0x61,
	0x72, 0x69, 0x62, 0x75, 0x2d, 0x63, 0x61, 0x70, 0x2f, 0x73, 0x61, 0x62, 0x69, 0x74, 0x6f, 0x75,
	0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x73, 0x2f, 0x67, 0x65, 0x6e, 0x2f, 0x67, 0x6f, 0x2f, 0x72,
	0x70, 0x63, 0x2f, 0x62, 0x75, 0x73, 0x69, 0x6e, 0x65, 0x73, 0x73, 0x2f, 0x76, 0x31, 0x3b, 0x62,
	0x75, 0x73, 0x69, 0x6e, 0x65, 0x73, 0x73, 0x76, 0x31, 0xa2, 0x02, 0x03, 0x42, 0x58, 0x58, 0xaa,
	0x02, 0x0b, 0x42, 0x75, 0x73, 0x69, 0x6e, 0x65, 0x73, 0x73, 0x2e, 0x56, 0x31, 0xca, 0x02, 0x0b,
	0x42, 0x75, 0x73, 0x69, 0x6e, 0x65, 0x73, 0x73, 0x5c, 0x56, 0x31, 0xe2, 0x02, 0x17, 0x42, 0x75,
	0x73, 0x69, 0x6e, 0x65, 0x73, 0x73, 0x5c, 0x56, 0x31, 0x5c, 0x47, 0x50, 0x42, 0x4d, 0x65, 0x74,
	0x61, 0x64, 0x61, 0x74, 0x61, 0xea, 0x02, 0x0c, 0x42, 0x75, 0x73, 0x69, 0x6e, 0x65, 0x73, 0x73,
	0x3a, 0x3a, 0x56, 0x31, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
})

var (
	file_business_v1_supplier_proto_rawDescOnce sync.Once
	file_business_v1_supplier_proto_rawDescData []byte
)

func file_business_v1_supplier_proto_rawDescGZIP() []byte {
	file_business_v1_supplier_proto_rawDescOnce.Do(func() {
		file_business_v1_supplier_proto_rawDescData = protoimpl.X.CompressGZIP(unsafe.Slice(unsafe.StringData(file_business_v1_supplier_proto_rawDesc), len(file_business_v1_supplier_proto_rawDesc)))
	})
	return file_business_v1_supplier_proto_rawDescData
}

var file_business_v1_supplier_proto_msgTypes = make([]protoimpl.MessageInfo, 12)
var file_business_v1_supplier_proto_goTypes = []any{
	(*Link)(nil),                         // 0: business.v1.Link
	(*Supplier)(nil),                     // 1: business.v1.Supplier
	(*CreateSupplierRequest)(nil),        // 2: business.v1.CreateSupplierRequest
	(*CreateSupplierResponse)(nil),       // 3: business.v1.CreateSupplierResponse
	(*GetSupplierRequest)(nil),           // 4: business.v1.GetSupplierRequest
	(*GetSupplierResponse)(nil),          // 5: business.v1.GetSupplierResponse
	(*GetBusinessSuppliersRequest)(nil),  // 6: business.v1.GetBusinessSuppliersRequest
	(*GetBusinessSuppliersResponse)(nil), // 7: business.v1.GetBusinessSuppliersResponse
	(*UpdateSupplierRequest)(nil),        // 8: business.v1.UpdateSupplierRequest
	(*UpdateSupplierResponse)(nil),       // 9: business.v1.UpdateSupplierResponse
	(*DeleteSupplierRequest)(nil),        // 10: business.v1.DeleteSupplierRequest
	(*DeleteSupplierResponse)(nil),       // 11: business.v1.DeleteSupplierResponse
	(*v1.ResourceLink)(nil),              // 12: link.v1.ResourceLink
}
var file_business_v1_supplier_proto_depIdxs = []int32{
	1,  // 0: business.v1.CreateSupplierRequest.supplier:type_name -> business.v1.Supplier
	12, // 1: business.v1.CreateSupplierRequest.external_links:type_name -> link.v1.ResourceLink
	1,  // 2: business.v1.GetSupplierResponse.supplier:type_name -> business.v1.Supplier
	1,  // 3: business.v1.GetBusinessSuppliersResponse.suppliers:type_name -> business.v1.Supplier
	1,  // 4: business.v1.UpdateSupplierRequest.supplier:type_name -> business.v1.Supplier
	12, // 5: business.v1.UpdateSupplierRequest.external_links:type_name -> link.v1.ResourceLink
	1,  // 6: business.v1.UpdateSupplierResponse.supplier:type_name -> business.v1.Supplier
	2,  // 7: business.v1.SupplierService.CreateSupplier:input_type -> business.v1.CreateSupplierRequest
	4,  // 8: business.v1.SupplierService.GetSupplier:input_type -> business.v1.GetSupplierRequest
	6,  // 9: business.v1.SupplierService.GetBusinessSuppliers:input_type -> business.v1.GetBusinessSuppliersRequest
	8,  // 10: business.v1.SupplierService.UpdateSupplier:input_type -> business.v1.UpdateSupplierRequest
	10, // 11: business.v1.SupplierService.DeleteSupplier:input_type -> business.v1.DeleteSupplierRequest
	3,  // 12: business.v1.SupplierService.CreateSupplier:output_type -> business.v1.CreateSupplierResponse
	5,  // 13: business.v1.SupplierService.GetSupplier:output_type -> business.v1.GetSupplierResponse
	7,  // 14: business.v1.SupplierService.GetBusinessSuppliers:output_type -> business.v1.GetBusinessSuppliersResponse
	9,  // 15: business.v1.SupplierService.UpdateSupplier:output_type -> business.v1.UpdateSupplierResponse
	11, // 16: business.v1.SupplierService.DeleteSupplier:output_type -> business.v1.DeleteSupplierResponse
	12, // [12:17] is the sub-list for method output_type
	7,  // [7:12] is the sub-list for method input_type
	7,  // [7:7] is the sub-list for extension type_name
	7,  // [7:7] is the sub-list for extension extendee
	0,  // [0:7] is the sub-list for field type_name
}

func init() { file_business_v1_supplier_proto_init() }
func file_business_v1_supplier_proto_init() {
	if File_business_v1_supplier_proto != nil {
		return
	}
	file_business_v1_supplier_proto_msgTypes[1].OneofWrappers = []any{}
	file_business_v1_supplier_proto_msgTypes[2].OneofWrappers = []any{}
	file_business_v1_supplier_proto_msgTypes[8].OneofWrappers = []any{}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: unsafe.Slice(unsafe.StringData(file_business_v1_supplier_proto_rawDesc), len(file_business_v1_supplier_proto_rawDesc)),
			NumEnums:      0,
			NumMessages:   12,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_business_v1_supplier_proto_goTypes,
		DependencyIndexes: file_business_v1_supplier_proto_depIdxs,
		MessageInfos:      file_business_v1_supplier_proto_msgTypes,
	}.Build()
	File_business_v1_supplier_proto = out.File
	file_business_v1_supplier_proto_goTypes = nil
	file_business_v1_supplier_proto_depIdxs = nil
}
