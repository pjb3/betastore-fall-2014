require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "create a product" do
    product = Product.new
    assert product.save, product.errors.full_messages
  end

  test "name is required" do
    product = Product.new
    refute product.save, 'name should be required'
    assert product.errors.full_messages.include?("Name can't be blank")
  end
end
