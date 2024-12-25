require "test_helper"
class OperationTest < ActiveSupport::TestCase
  test "is valid when all fields are filled in" do
    assert build(:operation).valid?
  end

  test "the user cannot take two identical books" do
    book = create(:book)
    user = create(:user)
    operation = create(:operation, book: book, user: user, returned: nil)
    duplicate_operation = build(:operation, book: book, user: user, returned: nil)

    assert_not duplicate_operation.valid?, "Дупликат операции с `returned: nil` должен быть недопустимым"
    assert build(:operation, book: book, user: user, returned: Time.zone.now).valid?, "Операция с возвращенной книгой должна быть допустимой"
  end
end
