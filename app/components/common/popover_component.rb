# frozen_string_literal: true

# Renders Tailwind Config Viewer HTML
module Common
  class PopoverComponent < ApplicationComponent
    # Container which displays hover when clicked / hovered
    renders_one :trigger, ->(html_attributes: {}, &block) do
      tag.div(**stimulus_target_option("trigger", html_attributes:), &block)
    end

    # Popover content
    renders_one :body, ->(html_attributes: {}, &block) do
      tag.template(**stimulus_target_option("body", html_attributes:), &block)
    end

    attr_reader :tippy_options

    def initialize(tippy_options: {}, html_attributes: {})
      @tippy_options = tippy_options
      super(html_attributes:)
    end

    def call
      tag.div(**wrapper_attributes) do
        concat(trigger)
        concat(body)
      end
    end

    private

    def default_html_attributes
      options = concat_html_attributes(super, { class: "w-fit" })

      stimulus_controller_attributes(values: { tippy_options: }, html_attributes: options)
    end
  end
end
