# frozen_string_literal: true

module Common
  class MultistepFormComponent::StepComponent < ApplicationComponent
    class << self
      def title = raise "StepComponent #{name} does not define title method"

      def input_attributes = raise "StepComponent #{name} does not define list of input attributes"

      def completed?(form_object)
        input_attributes.none? { |attr| form_object.errors.key?(attr) }
      end
    end

    attr_reader :multistep_form, :index, :form

    def initialize(multistep_form:, index:, html_attributes: {})
      @index = index
      @form = multistep_form.form
      @multistep_form = multistep_form
      super(html_attributes:)
    end

    def call
      raise "
        #{self.class.name} is a StepComponent. StepComponents is abstract by default.
        Components inheriting from it must define its own template or call method.
      "
    end

    def current_step? = index == multistep_form.current_step

    def completed? = self.class.completed?(@multistep_form.form.object)
  end
end
