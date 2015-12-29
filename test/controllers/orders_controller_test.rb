require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { anonymous: @order.anonymous, buyer_email: @order.buyer_email, buyer_name: @order.buyer_name, date: @order.date, message: @order.message, number: @order.number, order_details: @order.order_details, recipient_address: @order.recipient_address, recipient_name: @order.recipient_name, venmo_username: @order.venmo_username }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { anonymous: @order.anonymous, buyer_email: @order.buyer_email, buyer_name: @order.buyer_name, date: @order.date, message: @order.message, number: @order.number, order_details: @order.order_details, recipient_address: @order.recipient_address, recipient_name: @order.recipient_name, venmo_username: @order.venmo_username }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
