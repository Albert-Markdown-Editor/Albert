# frozen_string_literal: true

module Common
  class MultistepFormComponent < ApplicationComponent
    class << self
      def steps = raise "#{name} MultistepFormComponent does not define steps class model"
    end

    delegate :steps, to: :class

    attr_reader :url, :model, :form

    def initialize(url:, model:, html_attributes: {})
      @url = url
      @model = model
      super(html_attributes:)
    end

    def call
      form_with(url:, model: model) do |form|
        @form = form

        steps.each_with_index do |step, index|
          concat(step_wrapper(step) { render step.new(multistep_form: self, index:) })
        end
      end
    end

    def step_wrapper(step, html_attributes: {}, &content)
      tag.div(**html_attributes, &content)
    end

    def current_step
      previous_step_index = @model.current_step
      previous_step = steps[previous_step_index]

      @current_step ||= previous_step&.completed? ? previous_step_index + 1 : (previous_step_index || 0)
    end
  end
end
