require 'test_helper'
class OperationTest < ActiveSupport::TestCase
  test "is valid when all fields are filled in" do
    assert build(:operation).valid?
  end
end
