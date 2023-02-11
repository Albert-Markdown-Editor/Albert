# frozen_string_literal: true

require "test_helper"

class Common::MultistepFormComponentTest < ViewComponent::TestCase
  class SampleModel
    include ActiveModel::Model
    include MultistepFormModel

    attr_accessor :attribute_1, :attribute_2, :attribute_3

    validates_presence_of :attribute_1
    validates_presence_of :attribute_2
    validates_presence_of :attribute_3
  end

  class TestMultistepFormComponent < Common::MultistepFormComponent
    class << self
      def steps = [FirstTestStepComponent, SecondTestStepComponent, ThirdTestStepComponent]
    end
  end

  class FirstTestStepComponent < Common::MultistepFormComponent::StepComponent
    class << self
      def title = "First Step"
      def input_attributes = %i[attribute_1]
    end

    def call
      tag.div(**wrapper_attributes)
    end
  end

  class SecondTestStepComponent < Common::MultistepFormComponent::StepComponent
    class << self
      def title = "Second Step"
      def input_attributes = %i[attribute_2]
    end

    def call
      tag.div(**wrapper_attributes)
    end
  end

  class ThirdTestStepComponent < Common::MultistepFormComponent::StepComponent
    class << self
      def title = "Third Step"
      def input_attributes = %i[attribute_3]
    end

    def call
      tag.div(**wrapper_attributes)
    end
  end

  def setup
    @component = TestMultistepFormComponent
  end

  test "Renders multistep form" do
    render_inline(@component.new(form_url: "test", back_url: "test", model: SampleModel.new))
    assert_selector(".#{@component.component_class}")
  end

  test "Renders multistep form steps" do
    render_inline(@component.new(form_url: "test", back_url: "test", model: SampleModel.new))
    assert_selector(".#{FirstTestStepComponent.component_class}", visible: :all)
    assert_selector(".#{SecondTestStepComponent.component_class}", visible: :all)
    assert_selector(".#{ThirdTestStepComponent.component_class}", visible: :all)
  end

  test "Selects first step as current step if current_step value is nil" do
    model = SampleModel.new
    model.valid?
    result = @component.new(form_url: "test", back_url: "test", model:).current_step_index
    assert_equal 0, result
  end

  test "Selects next step if previous step is completed" do
    model = SampleModel.new(current_step: 0, attribute_1: 1)
    model.valid?
    result = @component.new(form_url: "test", back_url: "test", model:).current_step_index
    assert_equal 1, result
  end

  test "Selects previous step if it is uncompleted" do
    model = SampleModel.new(current_step: 2)
    model.valid?
    result = @component.new(form_url: "test", back_url: "test", model:).current_step_index
    assert_equal 0, result
  end

  test "Selects first uncompleted step over uncompleted previous step when it has a lower index" do
    model = SampleModel.new(current_step: 2)
    model.valid?
    result = @component.new(form_url: "test", back_url: "test", model:).current_step_index
    assert_equal 0, result
  end

  test "Updates latest step index when step index is greater than previous latests step" do
    model = SampleModel.new(current_step: 0, attribute_1: 1, latest_step: 0)
    model.valid?
    result = @component.new(form_url: "test", back_url: "test", model:).latest_step_index
    assert_equal 1, result
  end

  test "Updates latest step index if latests step index is nil" do
    model = SampleModel.new(current_step: 0)
    model.valid?
    result = @component.new(form_url: "test", back_url: "test", model:).latest_step_index
    assert_equal 0, result
  end

  test "Removes step validation error during initialization" do
    model = SampleModel.new(current_step: 0, attribute_1: 1)
    model.valid?
    result = @component.new(form_url: "test", back_url: "test", model:)

    assert result.current_step_index > 0 && result.current_step_index < (result.steps.count - 1)

    refute model.errors.has_key?(MultistepFormModel::ERROR_ATTRIBUTE)
  end

  test "Removes next steps validation errors during initialization" do
    model = SampleModel.new(current_step: 0, attribute_1: 1)
    model.valid?
    result = @component.new(form_url: "test", back_url: "test", model:)

    assert result.current_step_index > 0 && result.current_step_index < (result.steps.count - 1)
    next_steps_errors = @component.steps[result.current_step_index..].map { |s| s.input_attributes  }.flatten

    assert model.errors.attribute_names.all? { |e| !next_steps_errors.include?(e) }
  end
end
