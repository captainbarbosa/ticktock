require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "project model exists" do
    assert Developer
  end

  test "project has name & max number of allowed hours" do
    project = projects(:final_project)

    assert_equal "Final Project", project.name
    assert_equal 100, project.max_allowed_hours
  end

  test "project can have many time entries" do
    project = projects(:final_project)

    assert_operator project.time_entries.count, :>, 1
  end
end
