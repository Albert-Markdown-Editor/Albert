# frozen_string_literal: true

# Renders a form composed by multiple components, as a Wizard. The
# component accepts multiple sub-forms as input and, given the information
# present in the form object, infers the subform to be rendered (current
# step).
module Common
  class MultistepFormComponent < ApplicationComponent
    attr_reader :steps, :current_step, :form_object

    def initialize(steps:, form_object:)
      @steps = steps
      @form_object = form_object
      super
    end

    private

    def set_current_step

    end
  end
end
