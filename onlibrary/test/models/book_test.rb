require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "is valid when all fields are filled in" do
    assert build(:book).valid?
  end

  test "is not valid when some fields aren't filled in" do
    assert_not build(:book, name: nil).valid?
    assert_not build(:book, author: nil).valid?
    assert_not build(:book, count: nil).valid?
  end

  test "is valid when count < 0" do
    assert_not build(:book, count: -1).valid?
  end

  test "uniqueness of names" do
    book1 = create(:book, author: "Dave")
    assert_not build(:book, name: book1.name).valid?
  end
end
