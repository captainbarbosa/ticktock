require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should_get_new" do
    get :new
    assert_response :success
  end

  test "should_not_login_user_if_incorrect" do
    post :create, email: "wrong_user@example.com", password: "abc"
    assert_redirected_to login_path
  end

  test "should_login_user_if_correct" do
    @user = developers(:dev_1)

    post :create, email: @user.email, password: "very_secret"
    assert_redirected_to root_path
  end
end
