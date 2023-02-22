# frozen_string_literal: true

# Renders Tooltip Component
module Common
  class TooltipComponent < ApplicationComponent
    DEFAULT_TIPPY_OPTIONS = {
      # Attaches Tippy Body to component container
      appendTo: "parent",
      # Reveal animation
      animation: "shift-away",
      # Reveal / Hide animation duration
      duration: 300,
      arrow: true,
    }.freeze

    # Container which displays hover when hovered
    renders_one :trigger

    # Tooltip content
    renders_one :body

    attr_reader :tippy_options

    def initialize(tippy_options: DEFAULT_TIPPY_OPTIONS, html_attributes: {})
      @tippy_options = tippy_options
      super(html_attributes:)
    end

    def call
      render(PopoverComponent.new(tippy_options:, html_attributes: wrapper_attributes)) do |p|
        p.with_trigger do
          concat(trigger)
        end
        p.with_body do
          concat(body)
        end
      end
    end
  end
end
