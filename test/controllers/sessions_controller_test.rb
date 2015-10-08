require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def setup
    @controller = SessionsController.new
  end


  test "should get new member" do
     get :new
     assert_response :success
  end

  test "should get new admin" do
    get :new
    assert_response :success
  end


 

  def params
    {:session => { :email => "Example@gmail.com",:password =>"password" }}
  end

end
