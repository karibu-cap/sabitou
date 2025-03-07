// Code generated by protoc-gen-validate. DO NOT EDIT.
// source: order/v1/order.proto

package orderv1

import (
	"bytes"
	"errors"
	"fmt"
	"net"
	"net/mail"
	"net/url"
	"regexp"
	"sort"
	"strings"
	"time"
	"unicode/utf8"

	"google.golang.org/protobuf/types/known/anypb"
)

// ensure the imports are used
var (
	_ = bytes.MinRead
	_ = errors.New("")
	_ = fmt.Print
	_ = utf8.UTFMax
	_ = (*regexp.Regexp)(nil)
	_ = (*strings.Reader)(nil)
	_ = net.IPv4len
	_ = time.Duration(0)
	_ = (*url.URL)(nil)
	_ = (*mail.Address)(nil)
	_ = anypb.Any{}
	_ = sort.Sort
)

// Validate checks the field values on OrderItem with the rules defined in the
// proto definition for this message. If any rules are violated, the first
// error encountered is returned, or nil if there are no violations.
func (m *OrderItem) Validate() error {
	return m.validate(false)
}

// ValidateAll checks the field values on OrderItem with the rules defined in
// the proto definition for this message. If any rules are violated, the
// result is a list of violation errors wrapped in OrderItemMultiError, or nil
// if none found.
func (m *OrderItem) ValidateAll() error {
	return m.validate(true)
}

func (m *OrderItem) validate(all bool) error {
	if m == nil {
		return nil
	}

	var errors []error

	// no validation rules for ProductId

	// no validation rules for Quantity

	// no validation rules for UnitPriceInXafCents

	if len(errors) > 0 {
		return OrderItemMultiError(errors)
	}

	return nil
}

// OrderItemMultiError is an error wrapping multiple validation errors returned
// by OrderItem.ValidateAll() if the designated constraints aren't met.
type OrderItemMultiError []error

// Error returns a concatenation of all the error messages it wraps.
func (m OrderItemMultiError) Error() string {
	msgs := make([]string, 0, len(m))
	for _, err := range m {
		msgs = append(msgs, err.Error())
	}
	return strings.Join(msgs, "; ")
}

// AllErrors returns a list of validation violation errors.
func (m OrderItemMultiError) AllErrors() []error { return m }

// OrderItemValidationError is the validation error returned by
// OrderItem.Validate if the designated constraints aren't met.
type OrderItemValidationError struct {
	field  string
	reason string
	cause  error
	key    bool
}

// Field function returns field value.
func (e OrderItemValidationError) Field() string { return e.field }

// Reason function returns reason value.
func (e OrderItemValidationError) Reason() string { return e.reason }

// Cause function returns cause value.
func (e OrderItemValidationError) Cause() error { return e.cause }

// Key function returns key value.
func (e OrderItemValidationError) Key() bool { return e.key }

// ErrorName returns error name.
func (e OrderItemValidationError) ErrorName() string { return "OrderItemValidationError" }

// Error satisfies the builtin error interface
func (e OrderItemValidationError) Error() string {
	cause := ""
	if e.cause != nil {
		cause = fmt.Sprintf(" | caused by: %v", e.cause)
	}

	key := ""
	if e.key {
		key = "key for "
	}

	return fmt.Sprintf(
		"invalid %sOrderItem.%s: %s%s",
		key,
		e.field,
		e.reason,
		cause)
}

var _ error = OrderItemValidationError{}

var _ interface {
	Field() string
	Reason() string
	Key() bool
	Cause() error
	ErrorName() string
} = OrderItemValidationError{}

// Validate checks the field values on Order with the rules defined in the
// proto definition for this message. If any rules are violated, the first
// error encountered is returned, or nil if there are no violations.
func (m *Order) Validate() error {
	return m.validate(false)
}

// ValidateAll checks the field values on Order with the rules defined in the
// proto definition for this message. If any rules are violated, the result is
// a list of violation errors wrapped in OrderMultiError, or nil if none found.
func (m *Order) ValidateAll() error {
	return m.validate(true)
}

func (m *Order) validate(all bool) error {
	if m == nil {
		return nil
	}

	var errors []error

	// no validation rules for IsClientOrder

	for idx, item := range m.GetOrderItems() {
		_, _ = idx, item

		if all {
			switch v := interface{}(item).(type) {
			case interface{ ValidateAll() error }:
				if err := v.ValidateAll(); err != nil {
					errors = append(errors, OrderValidationError{
						field:  fmt.Sprintf("OrderItems[%v]", idx),
						reason: "embedded message failed validation",
						cause:  err,
					})
				}
			case interface{ Validate() error }:
				if err := v.Validate(); err != nil {
					errors = append(errors, OrderValidationError{
						field:  fmt.Sprintf("OrderItems[%v]", idx),
						reason: "embedded message failed validation",
						cause:  err,
					})
				}
			}
		} else if v, ok := interface{}(item).(interface{ Validate() error }); ok {
			if err := v.Validate(); err != nil {
				return OrderValidationError{
					field:  fmt.Sprintf("OrderItems[%v]", idx),
					reason: "embedded message failed validation",
					cause:  err,
				}
			}
		}

	}

	// no validation rules for TotalPriceInCents

	// no validation rules for Status

	if m.RefId != nil {
		// no validation rules for RefId
	}

	if m.FromId != nil {
		// no validation rules for FromId
	}

	if len(errors) > 0 {
		return OrderMultiError(errors)
	}

	return nil
}

// OrderMultiError is an error wrapping multiple validation errors returned by
// Order.ValidateAll() if the designated constraints aren't met.
type OrderMultiError []error

// Error returns a concatenation of all the error messages it wraps.
func (m OrderMultiError) Error() string {
	msgs := make([]string, 0, len(m))
	for _, err := range m {
		msgs = append(msgs, err.Error())
	}
	return strings.Join(msgs, "; ")
}

// AllErrors returns a list of validation violation errors.
func (m OrderMultiError) AllErrors() []error { return m }

// OrderValidationError is the validation error returned by Order.Validate if
// the designated constraints aren't met.
type OrderValidationError struct {
	field  string
	reason string
	cause  error
	key    bool
}

// Field function returns field value.
func (e OrderValidationError) Field() string { return e.field }

// Reason function returns reason value.
func (e OrderValidationError) Reason() string { return e.reason }

// Cause function returns cause value.
func (e OrderValidationError) Cause() error { return e.cause }

// Key function returns key value.
func (e OrderValidationError) Key() bool { return e.key }

// ErrorName returns error name.
func (e OrderValidationError) ErrorName() string { return "OrderValidationError" }

// Error satisfies the builtin error interface
func (e OrderValidationError) Error() string {
	cause := ""
	if e.cause != nil {
		cause = fmt.Sprintf(" | caused by: %v", e.cause)
	}

	key := ""
	if e.key {
		key = "key for "
	}

	return fmt.Sprintf(
		"invalid %sOrder.%s: %s%s",
		key,
		e.field,
		e.reason,
		cause)
}

var _ error = OrderValidationError{}

var _ interface {
	Field() string
	Reason() string
	Key() bool
	Cause() error
	ErrorName() string
} = OrderValidationError{}

// Validate checks the field values on CreateOrderRequest with the rules
// defined in the proto definition for this message. If any rules are
// violated, the first error encountered is returned, or nil if there are no violations.
func (m *CreateOrderRequest) Validate() error {
	return m.validate(false)
}

// ValidateAll checks the field values on CreateOrderRequest with the rules
// defined in the proto definition for this message. If any rules are
// violated, the result is a list of violation errors wrapped in
// CreateOrderRequestMultiError, or nil if none found.
func (m *CreateOrderRequest) ValidateAll() error {
	return m.validate(true)
}

func (m *CreateOrderRequest) validate(all bool) error {
	if m == nil {
		return nil
	}

	var errors []error

	if all {
		switch v := interface{}(m.GetOrder()).(type) {
		case interface{ ValidateAll() error }:
			if err := v.ValidateAll(); err != nil {
				errors = append(errors, CreateOrderRequestValidationError{
					field:  "Order",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		case interface{ Validate() error }:
			if err := v.Validate(); err != nil {
				errors = append(errors, CreateOrderRequestValidationError{
					field:  "Order",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		}
	} else if v, ok := interface{}(m.GetOrder()).(interface{ Validate() error }); ok {
		if err := v.Validate(); err != nil {
			return CreateOrderRequestValidationError{
				field:  "Order",
				reason: "embedded message failed validation",
				cause:  err,
			}
		}
	}

	// no validation rules for BusinessId

	if m.SupplierName != nil {
		// no validation rules for SupplierName
	}

	if len(errors) > 0 {
		return CreateOrderRequestMultiError(errors)
	}

	return nil
}

// CreateOrderRequestMultiError is an error wrapping multiple validation errors
// returned by CreateOrderRequest.ValidateAll() if the designated constraints
// aren't met.
type CreateOrderRequestMultiError []error

// Error returns a concatenation of all the error messages it wraps.
func (m CreateOrderRequestMultiError) Error() string {
	msgs := make([]string, 0, len(m))
	for _, err := range m {
		msgs = append(msgs, err.Error())
	}
	return strings.Join(msgs, "; ")
}

// AllErrors returns a list of validation violation errors.
func (m CreateOrderRequestMultiError) AllErrors() []error { return m }

// CreateOrderRequestValidationError is the validation error returned by
// CreateOrderRequest.Validate if the designated constraints aren't met.
type CreateOrderRequestValidationError struct {
	field  string
	reason string
	cause  error
	key    bool
}

// Field function returns field value.
func (e CreateOrderRequestValidationError) Field() string { return e.field }

// Reason function returns reason value.
func (e CreateOrderRequestValidationError) Reason() string { return e.reason }

// Cause function returns cause value.
func (e CreateOrderRequestValidationError) Cause() error { return e.cause }

// Key function returns key value.
func (e CreateOrderRequestValidationError) Key() bool { return e.key }

// ErrorName returns error name.
func (e CreateOrderRequestValidationError) ErrorName() string {
	return "CreateOrderRequestValidationError"
}

// Error satisfies the builtin error interface
func (e CreateOrderRequestValidationError) Error() string {
	cause := ""
	if e.cause != nil {
		cause = fmt.Sprintf(" | caused by: %v", e.cause)
	}

	key := ""
	if e.key {
		key = "key for "
	}

	return fmt.Sprintf(
		"invalid %sCreateOrderRequest.%s: %s%s",
		key,
		e.field,
		e.reason,
		cause)
}

var _ error = CreateOrderRequestValidationError{}

var _ interface {
	Field() string
	Reason() string
	Key() bool
	Cause() error
	ErrorName() string
} = CreateOrderRequestValidationError{}

// Validate checks the field values on CreateOrderResponse with the rules
// defined in the proto definition for this message. If any rules are
// violated, the first error encountered is returned, or nil if there are no violations.
func (m *CreateOrderResponse) Validate() error {
	return m.validate(false)
}

// ValidateAll checks the field values on CreateOrderResponse with the rules
// defined in the proto definition for this message. If any rules are
// violated, the result is a list of violation errors wrapped in
// CreateOrderResponseMultiError, or nil if none found.
func (m *CreateOrderResponse) ValidateAll() error {
	return m.validate(true)
}

func (m *CreateOrderResponse) validate(all bool) error {
	if m == nil {
		return nil
	}

	var errors []error

	// no validation rules for RefId

	if len(errors) > 0 {
		return CreateOrderResponseMultiError(errors)
	}

	return nil
}

// CreateOrderResponseMultiError is an error wrapping multiple validation
// errors returned by CreateOrderResponse.ValidateAll() if the designated
// constraints aren't met.
type CreateOrderResponseMultiError []error

// Error returns a concatenation of all the error messages it wraps.
func (m CreateOrderResponseMultiError) Error() string {
	msgs := make([]string, 0, len(m))
	for _, err := range m {
		msgs = append(msgs, err.Error())
	}
	return strings.Join(msgs, "; ")
}

// AllErrors returns a list of validation violation errors.
func (m CreateOrderResponseMultiError) AllErrors() []error { return m }

// CreateOrderResponseValidationError is the validation error returned by
// CreateOrderResponse.Validate if the designated constraints aren't met.
type CreateOrderResponseValidationError struct {
	field  string
	reason string
	cause  error
	key    bool
}

// Field function returns field value.
func (e CreateOrderResponseValidationError) Field() string { return e.field }

// Reason function returns reason value.
func (e CreateOrderResponseValidationError) Reason() string { return e.reason }

// Cause function returns cause value.
func (e CreateOrderResponseValidationError) Cause() error { return e.cause }

// Key function returns key value.
func (e CreateOrderResponseValidationError) Key() bool { return e.key }

// ErrorName returns error name.
func (e CreateOrderResponseValidationError) ErrorName() string {
	return "CreateOrderResponseValidationError"
}

// Error satisfies the builtin error interface
func (e CreateOrderResponseValidationError) Error() string {
	cause := ""
	if e.cause != nil {
		cause = fmt.Sprintf(" | caused by: %v", e.cause)
	}

	key := ""
	if e.key {
		key = "key for "
	}

	return fmt.Sprintf(
		"invalid %sCreateOrderResponse.%s: %s%s",
		key,
		e.field,
		e.reason,
		cause)
}

var _ error = CreateOrderResponseValidationError{}

var _ interface {
	Field() string
	Reason() string
	Key() bool
	Cause() error
	ErrorName() string
} = CreateOrderResponseValidationError{}

// Validate checks the field values on GetOrderRequest with the rules defined
// in the proto definition for this message. If any rules are violated, the
// first error encountered is returned, or nil if there are no violations.
func (m *GetOrderRequest) Validate() error {
	return m.validate(false)
}

// ValidateAll checks the field values on GetOrderRequest with the rules
// defined in the proto definition for this message. If any rules are
// violated, the result is a list of violation errors wrapped in
// GetOrderRequestMultiError, or nil if none found.
func (m *GetOrderRequest) ValidateAll() error {
	return m.validate(true)
}

func (m *GetOrderRequest) validate(all bool) error {
	if m == nil {
		return nil
	}

	var errors []error

	// no validation rules for RefId

	if len(errors) > 0 {
		return GetOrderRequestMultiError(errors)
	}

	return nil
}

// GetOrderRequestMultiError is an error wrapping multiple validation errors
// returned by GetOrderRequest.ValidateAll() if the designated constraints
// aren't met.
type GetOrderRequestMultiError []error

// Error returns a concatenation of all the error messages it wraps.
func (m GetOrderRequestMultiError) Error() string {
	msgs := make([]string, 0, len(m))
	for _, err := range m {
		msgs = append(msgs, err.Error())
	}
	return strings.Join(msgs, "; ")
}

// AllErrors returns a list of validation violation errors.
func (m GetOrderRequestMultiError) AllErrors() []error { return m }

// GetOrderRequestValidationError is the validation error returned by
// GetOrderRequest.Validate if the designated constraints aren't met.
type GetOrderRequestValidationError struct {
	field  string
	reason string
	cause  error
	key    bool
}

// Field function returns field value.
func (e GetOrderRequestValidationError) Field() string { return e.field }

// Reason function returns reason value.
func (e GetOrderRequestValidationError) Reason() string { return e.reason }

// Cause function returns cause value.
func (e GetOrderRequestValidationError) Cause() error { return e.cause }

// Key function returns key value.
func (e GetOrderRequestValidationError) Key() bool { return e.key }

// ErrorName returns error name.
func (e GetOrderRequestValidationError) ErrorName() string { return "GetOrderRequestValidationError" }

// Error satisfies the builtin error interface
func (e GetOrderRequestValidationError) Error() string {
	cause := ""
	if e.cause != nil {
		cause = fmt.Sprintf(" | caused by: %v", e.cause)
	}

	key := ""
	if e.key {
		key = "key for "
	}

	return fmt.Sprintf(
		"invalid %sGetOrderRequest.%s: %s%s",
		key,
		e.field,
		e.reason,
		cause)
}

var _ error = GetOrderRequestValidationError{}

var _ interface {
	Field() string
	Reason() string
	Key() bool
	Cause() error
	ErrorName() string
} = GetOrderRequestValidationError{}

// Validate checks the field values on GetOrderResponse with the rules defined
// in the proto definition for this message. If any rules are violated, the
// first error encountered is returned, or nil if there are no violations.
func (m *GetOrderResponse) Validate() error {
	return m.validate(false)
}

// ValidateAll checks the field values on GetOrderResponse with the rules
// defined in the proto definition for this message. If any rules are
// violated, the result is a list of violation errors wrapped in
// GetOrderResponseMultiError, or nil if none found.
func (m *GetOrderResponse) ValidateAll() error {
	return m.validate(true)
}

func (m *GetOrderResponse) validate(all bool) error {
	if m == nil {
		return nil
	}

	var errors []error

	if all {
		switch v := interface{}(m.GetOrder()).(type) {
		case interface{ ValidateAll() error }:
			if err := v.ValidateAll(); err != nil {
				errors = append(errors, GetOrderResponseValidationError{
					field:  "Order",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		case interface{ Validate() error }:
			if err := v.Validate(); err != nil {
				errors = append(errors, GetOrderResponseValidationError{
					field:  "Order",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		}
	} else if v, ok := interface{}(m.GetOrder()).(interface{ Validate() error }); ok {
		if err := v.Validate(); err != nil {
			return GetOrderResponseValidationError{
				field:  "Order",
				reason: "embedded message failed validation",
				cause:  err,
			}
		}
	}

	// no validation rules for CreatedAt

	if m.UpdatedAt != nil {
		// no validation rules for UpdatedAt
	}

	if len(errors) > 0 {
		return GetOrderResponseMultiError(errors)
	}

	return nil
}

// GetOrderResponseMultiError is an error wrapping multiple validation errors
// returned by GetOrderResponse.ValidateAll() if the designated constraints
// aren't met.
type GetOrderResponseMultiError []error

// Error returns a concatenation of all the error messages it wraps.
func (m GetOrderResponseMultiError) Error() string {
	msgs := make([]string, 0, len(m))
	for _, err := range m {
		msgs = append(msgs, err.Error())
	}
	return strings.Join(msgs, "; ")
}

// AllErrors returns a list of validation violation errors.
func (m GetOrderResponseMultiError) AllErrors() []error { return m }

// GetOrderResponseValidationError is the validation error returned by
// GetOrderResponse.Validate if the designated constraints aren't met.
type GetOrderResponseValidationError struct {
	field  string
	reason string
	cause  error
	key    bool
}

// Field function returns field value.
func (e GetOrderResponseValidationError) Field() string { return e.field }

// Reason function returns reason value.
func (e GetOrderResponseValidationError) Reason() string { return e.reason }

// Cause function returns cause value.
func (e GetOrderResponseValidationError) Cause() error { return e.cause }

// Key function returns key value.
func (e GetOrderResponseValidationError) Key() bool { return e.key }

// ErrorName returns error name.
func (e GetOrderResponseValidationError) ErrorName() string { return "GetOrderResponseValidationError" }

// Error satisfies the builtin error interface
func (e GetOrderResponseValidationError) Error() string {
	cause := ""
	if e.cause != nil {
		cause = fmt.Sprintf(" | caused by: %v", e.cause)
	}

	key := ""
	if e.key {
		key = "key for "
	}

	return fmt.Sprintf(
		"invalid %sGetOrderResponse.%s: %s%s",
		key,
		e.field,
		e.reason,
		cause)
}

var _ error = GetOrderResponseValidationError{}

var _ interface {
	Field() string
	Reason() string
	Key() bool
	Cause() error
	ErrorName() string
} = GetOrderResponseValidationError{}

// Validate checks the field values on DeleteOrderRequest with the rules
// defined in the proto definition for this message. If any rules are
// violated, the first error encountered is returned, or nil if there are no violations.
func (m *DeleteOrderRequest) Validate() error {
	return m.validate(false)
}

// ValidateAll checks the field values on DeleteOrderRequest with the rules
// defined in the proto definition for this message. If any rules are
// violated, the result is a list of violation errors wrapped in
// DeleteOrderRequestMultiError, or nil if none found.
func (m *DeleteOrderRequest) ValidateAll() error {
	return m.validate(true)
}

func (m *DeleteOrderRequest) validate(all bool) error {
	if m == nil {
		return nil
	}

	var errors []error

	// no validation rules for RefId

	if len(errors) > 0 {
		return DeleteOrderRequestMultiError(errors)
	}

	return nil
}

// DeleteOrderRequestMultiError is an error wrapping multiple validation errors
// returned by DeleteOrderRequest.ValidateAll() if the designated constraints
// aren't met.
type DeleteOrderRequestMultiError []error

// Error returns a concatenation of all the error messages it wraps.
func (m DeleteOrderRequestMultiError) Error() string {
	msgs := make([]string, 0, len(m))
	for _, err := range m {
		msgs = append(msgs, err.Error())
	}
	return strings.Join(msgs, "; ")
}

// AllErrors returns a list of validation violation errors.
func (m DeleteOrderRequestMultiError) AllErrors() []error { return m }

// DeleteOrderRequestValidationError is the validation error returned by
// DeleteOrderRequest.Validate if the designated constraints aren't met.
type DeleteOrderRequestValidationError struct {
	field  string
	reason string
	cause  error
	key    bool
}

// Field function returns field value.
func (e DeleteOrderRequestValidationError) Field() string { return e.field }

// Reason function returns reason value.
func (e DeleteOrderRequestValidationError) Reason() string { return e.reason }

// Cause function returns cause value.
func (e DeleteOrderRequestValidationError) Cause() error { return e.cause }

// Key function returns key value.
func (e DeleteOrderRequestValidationError) Key() bool { return e.key }

// ErrorName returns error name.
func (e DeleteOrderRequestValidationError) ErrorName() string {
	return "DeleteOrderRequestValidationError"
}

// Error satisfies the builtin error interface
func (e DeleteOrderRequestValidationError) Error() string {
	cause := ""
	if e.cause != nil {
		cause = fmt.Sprintf(" | caused by: %v", e.cause)
	}

	key := ""
	if e.key {
		key = "key for "
	}

	return fmt.Sprintf(
		"invalid %sDeleteOrderRequest.%s: %s%s",
		key,
		e.field,
		e.reason,
		cause)
}

var _ error = DeleteOrderRequestValidationError{}

var _ interface {
	Field() string
	Reason() string
	Key() bool
	Cause() error
	ErrorName() string
} = DeleteOrderRequestValidationError{}

// Validate checks the field values on DeleteOrderResponse with the rules
// defined in the proto definition for this message. If any rules are
// violated, the first error encountered is returned, or nil if there are no violations.
func (m *DeleteOrderResponse) Validate() error {
	return m.validate(false)
}

// ValidateAll checks the field values on DeleteOrderResponse with the rules
// defined in the proto definition for this message. If any rules are
// violated, the result is a list of violation errors wrapped in
// DeleteOrderResponseMultiError, or nil if none found.
func (m *DeleteOrderResponse) ValidateAll() error {
	return m.validate(true)
}

func (m *DeleteOrderResponse) validate(all bool) error {
	if m == nil {
		return nil
	}

	var errors []error

	// no validation rules for Success

	if len(errors) > 0 {
		return DeleteOrderResponseMultiError(errors)
	}

	return nil
}

// DeleteOrderResponseMultiError is an error wrapping multiple validation
// errors returned by DeleteOrderResponse.ValidateAll() if the designated
// constraints aren't met.
type DeleteOrderResponseMultiError []error

// Error returns a concatenation of all the error messages it wraps.
func (m DeleteOrderResponseMultiError) Error() string {
	msgs := make([]string, 0, len(m))
	for _, err := range m {
		msgs = append(msgs, err.Error())
	}
	return strings.Join(msgs, "; ")
}

// AllErrors returns a list of validation violation errors.
func (m DeleteOrderResponseMultiError) AllErrors() []error { return m }

// DeleteOrderResponseValidationError is the validation error returned by
// DeleteOrderResponse.Validate if the designated constraints aren't met.
type DeleteOrderResponseValidationError struct {
	field  string
	reason string
	cause  error
	key    bool
}

// Field function returns field value.
func (e DeleteOrderResponseValidationError) Field() string { return e.field }

// Reason function returns reason value.
func (e DeleteOrderResponseValidationError) Reason() string { return e.reason }

// Cause function returns cause value.
func (e DeleteOrderResponseValidationError) Cause() error { return e.cause }

// Key function returns key value.
func (e DeleteOrderResponseValidationError) Key() bool { return e.key }

// ErrorName returns error name.
func (e DeleteOrderResponseValidationError) ErrorName() string {
	return "DeleteOrderResponseValidationError"
}

// Error satisfies the builtin error interface
func (e DeleteOrderResponseValidationError) Error() string {
	cause := ""
	if e.cause != nil {
		cause = fmt.Sprintf(" | caused by: %v", e.cause)
	}

	key := ""
	if e.key {
		key = "key for "
	}

	return fmt.Sprintf(
		"invalid %sDeleteOrderResponse.%s: %s%s",
		key,
		e.field,
		e.reason,
		cause)
}

var _ error = DeleteOrderResponseValidationError{}

var _ interface {
	Field() string
	Reason() string
	Key() bool
	Cause() error
	ErrorName() string
} = DeleteOrderResponseValidationError{}
