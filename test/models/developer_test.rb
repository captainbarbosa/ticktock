require "test_helper"

class DeveloperTest < ActiveSupport::TestCase
  test "developer model exists" do
    assert Developer
  end

  test "developer has email and password" do
    developer = developers(:dev_1)

    assert_equal "dev1@email.com", developer.email
  end

  test "developer must be created with an email" do
    developer = Developer.create(password: "some_password")

    assert_equal false, developer.valid?
  end

  test "new developers must have all attributes" do
    assert_equal false, developers(:developer_without_first_name).valid?
    assert_equal false, developers(:developer_without_last_name).valid?
    assert_equal false, developers(:developer_without_email).valid?
    assert_equal false, developers(:developer_without_password).valid?
  end

  test "developer has a method that verified if they have time entries" do
    developer = developers(:developer_with_no_time_entries)
    assert_equal true, developer.no_time_entries?
  end

  test "developers weekly hours can be calculated" do
    developer = developers(:dev_2)

    assert_equal 6, developer.weekly_hours
  end

  test "developers overtime hours can be calculated" do
    developer = developers(:dev_1)

    assert_equal true, developer.overtime?
    assert_equal 1, developer.overtime_by
  end
end
