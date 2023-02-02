require "test_helper"

class BookTest < ActiveSupport::TestCase
  # Model Validations
  # -----------------
  test "A book requires a name" do
    result = FactoryBot.build(:book)
    assert result.valid?

    result.title = nil
    assert_not result.valid?
    assert result.errors.key?(:title)
  end
end
