require 'test_helper'

class TimeEntryTest < ActiveSupport::TestCase
  test "time entry model exists" do
    assert TimeEntry
  end

  test "time entry has a subject" do
    time_entry = time_entries(:time_entry_one)
    assert_equal "Planning database structure", time_entry.subject
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
