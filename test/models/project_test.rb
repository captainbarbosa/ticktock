require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "project model exists" do
    assert Developer
  end
  
  test "project must have name & max number of allowed hours" do
    assert_equal false, projects(:project_without_name).valid?
    assert_equal false, projects(:project_without_hours).valid?
  end

  test "project can have many time entries" do
    project = projects(:final_project)

    assert_operator project.time_entries.count, :>, 1
  end
end
