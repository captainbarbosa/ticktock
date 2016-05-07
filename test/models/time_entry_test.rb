require 'test_helper'

class TimeEntryTest < ActiveSupport::TestCase
  test "time entry model exists" do
    assert TimeEntry
  end

  test "time entries must have subject, duration, & project_id" do
    assert_equal false, time_entries(:time_entry_without_duration).valid?
    assert_equal false, time_entries(:time_entry_without_subject).valid?
    assert_equal false, time_entries(:time_entry_without_project_id).valid?
  end

  test "time entry belongs to a developer" do
    time_entry = time_entries(:time_entry_one)
    assert_equal true, time_entry.developer.valid?
  end

  test "time entry belongs to a project" do
    time_entry = time_entries(:time_entry_one)
    assert_equal true, time_entry.project.valid?
  end
end
