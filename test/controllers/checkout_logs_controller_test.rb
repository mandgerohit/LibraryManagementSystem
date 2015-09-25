require 'test_helper'

class CheckoutLogsControllerTest < ActionController::TestCase
user=User.create(name: "pp",email: "pp@jj.com",password: "pass",password_confirmation: "pass",admin: "no",member: "yes")
  test "should get new" do
    get :new
    assert_response :success
  end
  test "should fail if user not admin" do
    
    get :checkout_log_params
    assert_response :fail
end


