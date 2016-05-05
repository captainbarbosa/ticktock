require 'test_helper'

class DevelopersControllerTest < ActionController::TestCase
  test "adding a new developer redirects to root path" do
    @user = developers(:dev_1)
    session[:user_id] = @user.id

    assert_difference("Developer.count") do
      post :create, developer: {
        email: "person@example.com",
        password: "password",
        first_name: "Chrissy",
        last_name: "Coder" }
    end
    assert_redirected_to root_path
  end
end
