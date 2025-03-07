// Code generated by protoc-gen-validate. DO NOT EDIT.
// source: link/v1/link.proto

package linkv1

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

// Validate checks the field values on ResourceLink with the rules defined in
// the proto definition for this message. If any rules are violated, the first
// error encountered is returned, or nil if there are no violations.
func (m *ResourceLink) Validate() error {
	return m.validate(false)
}

// ValidateAll checks the field values on ResourceLink with the rules defined
// in the proto definition for this message. If any rules are violated, the
// result is a list of violation errors wrapped in ResourceLinkMultiError, or
// nil if none found.
func (m *ResourceLink) ValidateAll() error {
	return m.validate(true)
}

func (m *ResourceLink) validate(all bool) error {
	if m == nil {
		return nil
	}

	var errors []error

	// no validation rules for TargetUri

	if m.RefId != nil {
		// no validation rules for RefId
	}

	if m.IconUri != nil {
		// no validation rules for IconUri
	}

	if m.Info != nil {
		// no validation rules for Info
	}

	if m.Label != nil {
		// no validation rules for Label
	}

	if len(errors) > 0 {
		return ResourceLinkMultiError(errors)
	}

	return nil
}

// ResourceLinkMultiError is an error wrapping multiple validation errors
// returned by ResourceLink.ValidateAll() if the designated constraints aren't met.
type ResourceLinkMultiError []error

// Error returns a concatenation of all the error messages it wraps.
func (m ResourceLinkMultiError) Error() string {
	msgs := make([]string, 0, len(m))
	for _, err := range m {
		msgs = append(msgs, err.Error())
	}
	return strings.Join(msgs, "; ")
}

// AllErrors returns a list of validation violation errors.
func (m ResourceLinkMultiError) AllErrors() []error { return m }

// ResourceLinkValidationError is the validation error returned by
// ResourceLink.Validate if the designated constraints aren't met.
type ResourceLinkValidationError struct {
	field  string
	reason string
	cause  error
	key    bool
}

// Field function returns field value.
func (e ResourceLinkValidationError) Field() string { return e.field }

// Reason function returns reason value.
func (e ResourceLinkValidationError) Reason() string { return e.reason }

// Cause function returns cause value.
func (e ResourceLinkValidationError) Cause() error { return e.cause }

// Key function returns key value.
func (e ResourceLinkValidationError) Key() bool { return e.key }

// ErrorName returns error name.
func (e ResourceLinkValidationError) ErrorName() string { return "ResourceLinkValidationError" }

// Error satisfies the builtin error interface
func (e ResourceLinkValidationError) Error() string {
	cause := ""
	if e.cause != nil {
		cause = fmt.Sprintf(" | caused by: %v", e.cause)
	}

	key := ""
	if e.key {
		key = "key for "
	}

	return fmt.Sprintf(
		"invalid %sResourceLink.%s: %s%s",
		key,
		e.field,
		e.reason,
		cause)
}

var _ error = ResourceLinkValidationError{}

var _ interface {
	Field() string
	Reason() string
	Key() bool
	Cause() error
	ErrorName() string
} = ResourceLinkValidationError{}

// Validate checks the field values on GetResourceLinksRequest with the rules
// defined in the proto definition for this message. If any rules are
// violated, the first error encountered is returned, or nil if there are no violations.
func (m *GetResourceLinksRequest) Validate() error {
	return m.validate(false)
}

// ValidateAll checks the field values on GetResourceLinksRequest with the
// rules defined in the proto definition for this message. If any rules are
// violated, the result is a list of violation errors wrapped in
// GetResourceLinksRequestMultiError, or nil if none found.
func (m *GetResourceLinksRequest) ValidateAll() error {
	return m.validate(true)
}

func (m *GetResourceLinksRequest) validate(all bool) error {
	if m == nil {
		return nil
	}

	var errors []error

	if len(errors) > 0 {
		return GetResourceLinksRequestMultiError(errors)
	}

	return nil
}

// GetResourceLinksRequestMultiError is an error wrapping multiple validation
// errors returned by GetResourceLinksRequest.ValidateAll() if the designated
// constraints aren't met.
type GetResourceLinksRequestMultiError []error

// Error returns a concatenation of all the error messages it wraps.
func (m GetResourceLinksRequestMultiError) Error() string {
	msgs := make([]string, 0, len(m))
	for _, err := range m {
		msgs = append(msgs, err.Error())
	}
	return strings.Join(msgs, "; ")
}

// AllErrors returns a list of validation violation errors.
func (m GetResourceLinksRequestMultiError) AllErrors() []error { return m }

// GetResourceLinksRequestValidationError is the validation error returned by
// GetResourceLinksRequest.Validate if the designated constraints aren't met.
type GetResourceLinksRequestValidationError struct {
	field  string
	reason string
	cause  error
	key    bool
}

// Field function returns field value.
func (e GetResourceLinksRequestValidationError) Field() string { return e.field }

// Reason function returns reason value.
func (e GetResourceLinksRequestValidationError) Reason() string { return e.reason }

// Cause function returns cause value.
func (e GetResourceLinksRequestValidationError) Cause() error { return e.cause }

// Key function returns key value.
func (e GetResourceLinksRequestValidationError) Key() bool { return e.key }

// ErrorName returns error name.
func (e GetResourceLinksRequestValidationError) ErrorName() string {
	return "GetResourceLinksRequestValidationError"
}

// Error satisfies the builtin error interface
func (e GetResourceLinksRequestValidationError) Error() string {
	cause := ""
	if e.cause != nil {
		cause = fmt.Sprintf(" | caused by: %v", e.cause)
	}

	key := ""
	if e.key {
		key = "key for "
	}

	return fmt.Sprintf(
		"invalid %sGetResourceLinksRequest.%s: %s%s",
		key,
		e.field,
		e.reason,
		cause)
}

var _ error = GetResourceLinksRequestValidationError{}

var _ interface {
	Field() string
	Reason() string
	Key() bool
	Cause() error
	ErrorName() string
} = GetResourceLinksRequestValidationError{}

// Validate checks the field values on GetResourceLinksResponse with the rules
// defined in the proto definition for this message. If any rules are
// violated, the first error encountered is returned, or nil if there are no violations.
func (m *GetResourceLinksResponse) Validate() error {
	return m.validate(false)
}

// ValidateAll checks the field values on GetResourceLinksResponse with the
// rules defined in the proto definition for this message. If any rules are
// violated, the result is a list of violation errors wrapped in
// GetResourceLinksResponseMultiError, or nil if none found.
func (m *GetResourceLinksResponse) ValidateAll() error {
	return m.validate(true)
}

func (m *GetResourceLinksResponse) validate(all bool) error {
	if m == nil {
		return nil
	}

	var errors []error

	{
		sorted_keys := make([]string, len(m.GetLink()))
		i := 0
		for key := range m.GetLink() {
			sorted_keys[i] = key
			i++
		}
		sort.Slice(sorted_keys, func(i, j int) bool { return sorted_keys[i] < sorted_keys[j] })
		for _, key := range sorted_keys {
			val := m.GetLink()[key]
			_ = val

			// no validation rules for Link[key]

			if all {
				switch v := interface{}(val).(type) {
				case interface{ ValidateAll() error }:
					if err := v.ValidateAll(); err != nil {
						errors = append(errors, GetResourceLinksResponseValidationError{
							field:  fmt.Sprintf("Link[%v]", key),
							reason: "embedded message failed validation",
							cause:  err,
						})
					}
				case interface{ Validate() error }:
					if err := v.Validate(); err != nil {
						errors = append(errors, GetResourceLinksResponseValidationError{
							field:  fmt.Sprintf("Link[%v]", key),
							reason: "embedded message failed validation",
							cause:  err,
						})
					}
				}
			} else if v, ok := interface{}(val).(interface{ Validate() error }); ok {
				if err := v.Validate(); err != nil {
					return GetResourceLinksResponseValidationError{
						field:  fmt.Sprintf("Link[%v]", key),
						reason: "embedded message failed validation",
						cause:  err,
					}
				}
			}

		}
	}

	if len(errors) > 0 {
		return GetResourceLinksResponseMultiError(errors)
	}

	return nil
}

// GetResourceLinksResponseMultiError is an error wrapping multiple validation
// errors returned by GetResourceLinksResponse.ValidateAll() if the designated
// constraints aren't met.
type GetResourceLinksResponseMultiError []error

// Error returns a concatenation of all the error messages it wraps.
func (m GetResourceLinksResponseMultiError) Error() string {
	msgs := make([]string, 0, len(m))
	for _, err := range m {
		msgs = append(msgs, err.Error())
	}
	return strings.Join(msgs, "; ")
}

// AllErrors returns a list of validation violation errors.
func (m GetResourceLinksResponseMultiError) AllErrors() []error { return m }

// GetResourceLinksResponseValidationError is the validation error returned by
// GetResourceLinksResponse.Validate if the designated constraints aren't met.
type GetResourceLinksResponseValidationError struct {
	field  string
	reason string
	cause  error
	key    bool
}

// Field function returns field value.
func (e GetResourceLinksResponseValidationError) Field() string { return e.field }

// Reason function returns reason value.
func (e GetResourceLinksResponseValidationError) Reason() string { return e.reason }

// Cause function returns cause value.
func (e GetResourceLinksResponseValidationError) Cause() error { return e.cause }

// Key function returns key value.
func (e GetResourceLinksResponseValidationError) Key() bool { return e.key }

// ErrorName returns error name.
func (e GetResourceLinksResponseValidationError) ErrorName() string {
	return "GetResourceLinksResponseValidationError"
}

// Error satisfies the builtin error interface
func (e GetResourceLinksResponseValidationError) Error() string {
	cause := ""
	if e.cause != nil {
		cause = fmt.Sprintf(" | caused by: %v", e.cause)
	}

	key := ""
	if e.key {
		key = "key for "
	}

	return fmt.Sprintf(
		"invalid %sGetResourceLinksResponse.%s: %s%s",
		key,
		e.field,
		e.reason,
		cause)
}

var _ error = GetResourceLinksResponseValidationError{}

var _ interface {
	Field() string
	Reason() string
	Key() bool
	Cause() error
	ErrorName() string
} = GetResourceLinksResponseValidationError{}
