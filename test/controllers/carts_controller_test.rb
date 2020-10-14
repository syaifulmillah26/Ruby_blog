require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get carts_show_url
    assert_response :success
  end

  test "should get carts" do
    get carts_carts_url
    assert_response :success
  end

  test "should get cart" do
    get carts_cart_url
    assert_response :success
  end

end
