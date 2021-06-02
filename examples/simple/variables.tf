// =================================================================
//
// Work of the U.S. Department of Defense, Defense Digital Service.
// Released as open source under the MIT License.  See LICENSE file.
//
// =================================================================

// Do not provide default values for the variables in the examples.
// The variables will be set in the go tests

variable "tags" {
  type = map(string)
}

variable "test_name" {
  type = string
}
