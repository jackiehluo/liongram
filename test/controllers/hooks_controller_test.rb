require 'test_helper'

class HooksControllerTest < ActionController::TestCase
  test "should get new_order_callback" do
    get :new_order_callback
    assert_response :success
  end

end
