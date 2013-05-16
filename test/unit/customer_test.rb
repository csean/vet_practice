require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "01 name is present" do
    customer = Customer.new
    assert !customer.save, "Name is required"
  end
end
