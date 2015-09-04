require 'test_helper'

class SigninControllerTest < ActionController::TestCase
  test "should get signin" do
    get :signin
    assert_response :success
  end

end
