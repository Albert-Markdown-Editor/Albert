require "test_helper"

class MultistepFormModelTest < ActiveSupport::TestCase
  class ValidMultistepFormMode
    include ActiveModel::Model
    include MultistepFormModel
  end

  def setup
    @model = ValidMultistepFormMode.new
  end

  # Validations
  # -----------
  test "MultistepFormModel does not apply step validation if total and current attibutes are not specified" do
    assert_nil @model.current_step
    assert_nil @model.total_steps
    assert @model.valid?
  end

  test "MultistepFormModel is valid only when total and current steps are the same" do
    @model.current_step = 1
    @model.total_steps = 2
    refute @model.valid?

    @model.current_step = 3
    @model.total_steps = 3
    assert @model.valid?
  end

  test "MultistepFormModel sets custom error attribute and detail when total and current step attributes are invalid" do
    @model.current_step = 1
    @model.total_steps = 2
    refute @model.valid?

    assert_equal @model.errors.first.attribute, MultistepFormModel::ERROR_ATTRIBUTE
    assert_equal @model.errors.first.detail, MultistepFormModel::ERROR_DETAIL
  end
end
