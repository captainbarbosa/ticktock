require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test "adding a new project redirects to root path" do
    @user = developers(:dev_1)
    session[:user_id] = @user.id

    assert_difference "Project.count", +1 do
      post :create, project: {
        name: "iOS app",
        max_allowed_hours: 200 }
    end

    assert_redirected_to projects_path
  end
end
