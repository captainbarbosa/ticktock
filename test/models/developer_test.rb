require "test_helper"

class DeveloperTest < ActiveSupport::TestCase
  test "developer model exists" do
    assert Developer
  end

  test "developer has email and password" do
    developer = developers(:one)

    assert_equal "dev1@email.com", developer.email
  end

  test "developer must be created with an email" do
    developer = Developer.create(password: "some_password")

    assert_equal false, developer.valid?
  end
end
