require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "total amount is set when saving order" do
    order = Order.new(customer: customers(:paul))
    order.save

    order.line_items.create(
      product: products(:hat),
      quantity: 1)

    assert_equal 9.99, order.total_amount
  end
end
