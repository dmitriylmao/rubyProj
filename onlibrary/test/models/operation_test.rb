require "test_helper"
class OperationTest < ActiveSupport::TestCase
  test "is valid when all fields are filled in" do
    assert build(:operation).valid?
  end

  test "returned after took" do
    assert_not build(:operation, took: Time.zone.today, returned: Time.zone.yesterday).valid?
  end

  test "is not valid when some fields aren't filled in" do
    assert_not build(:operation, user: nil).valid?
    assert_not build(:operation, book: nil).valid?
    assert_not build(:operation, took: nil).valid?
  end

  test "the user cannot take two identical books" do
    book = create(:book)
    user = create(:user)
    operation = create(:operation, book: book, user: user, returned: nil)
    duplicate_operation = build(:operation, book: book, user: user, returned: nil)

    assert_not duplicate_operation.valid?, "Дупликат операции с `returned: nil` должен быть недопустимым"
    duplicate_operation.returned = Time.zone.now
    duplicate_operation.save

    operation.returned = Time.zone.now
    operation.save

    assert build(:operation, book: book, user: user).valid?, "Операция с возвращенной книгой должна быть допустимой"
  end
end
