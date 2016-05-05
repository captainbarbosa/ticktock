require 'test_helper'

class TimeEntriesControllerTest < ActionController::TestCase
  test "adding a new time entry redirects to time entries index" do
    @user = developers(:dev_1)
    session[:user_id] = @user.id

    @project = projects(:final_project)

    post :create, time_entry: {
      subject: "Writing Tests",
      start_time: "2016-12-12 18:43:19 UTC",
      end_time: "2016-12-22 18:43:19 UTC",
      project_id: @project.id,
      developer_id: @user.id }

    assert_redirected_to time_entries_path
  end
end
