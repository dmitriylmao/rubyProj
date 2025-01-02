require "test_helper"
class UserTest < ActiveSupport::TestCase
  test "is valid when all fields are filled in" do
    assert build(:user).valid?
  end
  test "user without attributes" do
    assert_not build(:user, role: nil).valid?
    assert_not build(:user, email: nil).valid?
    assert_not build(:user, password: nil).valid?
    assert_not build(:user, username: nil).valid?
  end
  test "admin account" do
    assert build(:user, :admin).valid?
  end
  test "unique email" do
    user1 = create(:user, username: "Dima")
    assert_not build(:user, username: "Egor").valid?
  end
  test "unique username" do
    user1 = create(:user, email: "example@example.com")
    assert_not build(:user, email: "anotherexample@example.com").valid?
  end
end
