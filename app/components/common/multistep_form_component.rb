# frozen_string_literal: true

module Common
  class MultistepFormComponent < ApplicationComponent
    class << self
      def steps = raise "#{name} MultistepFormComponent does not define steps class model"
    end

    delegate :steps, to: :class

    attr_reader :form_url, :back_url, :model, :form

    def initialize(form_url:, back_url:, model:, html_attributes: {})
      @form_url = form_url
      @back_url = back_url
      @model = model
      super(html_attributes:)
    end

    def call
      form_with(form_url:, model: model, **wrapper_attributes) do |form|
        @form = form

        concat(form.hidden_field(:current_step))
        concat(form.hidden_field(:total_steps))

        steps.each_with_index do |step, index|
          concat(step_wrapper(step, index) { render step.new(multistep_component: self, index:) })
        end
      end
    end

    def radio_id(step_index) = "#{object_id}_radio_#{step_index}"

    def checkbox_id(step_index) = "#{object_id}_radio_#{step_index}"

    def step_wrapper(step, index, html_attributes: {}, &content)
      tag.div(**html_attributes) do
        concat(
          radio_button_tag(
            radio_id(nil),
            1,
            current_step_index == index,
            id: radio_id(index),
            class: "hidden peer/radio"
          )
        )
        concat(
          check_box_tag(
            checkbox_id(index),
            1,
            current_step_index == index,
            id: checkbox_id(index),
            class: "hidden peer/checkbox"
          )
        )
        concat(capture(&content))
      end
    end

    def previous_step_index
      model.current_step.blank? ? 0 : model.current_step.to_i
    end

    def previous_step_completed?
      steps[previous_step_index]&.completed?(model)
    end

    def first_incomplete_step_index
      steps.find_index { |s| !s.completed?(model) } || 0
    end

    def previous_step_next_incompleted_step_index
      uncompleted_step = steps[previous_step_index..].find { |s| s.completed?(model) }
      steps.find_index(uncompleted_step)
    end

    def current_step_index = previous_step_index + (previous_step_completed? ? 1 : 0)
  end
end
