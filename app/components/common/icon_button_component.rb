# frozen_string_literal: true

# Renders Dropdown Component
module Common
  class IconButtonComponent < ApplicationComponent
    ICON_SIZES = {
      sm: "sm",
      base: "lg",
      lg: "xl",
    }

    SIZE_CLASSES = "
      data-[size=sm]:h-8 data-[size=sm]:w-8
      data-[size=base]:h-12 data-[size=base]:w-12
      data-[size=lg]:h-14 data-[size=lg]:w-14
    "

    BUTTON_CLASSES = "
      cursor-pointer inline-flex justify-center items-center
    "

    attr_reader :html_tag, :theme, :size, :icon_size, :icon, :icon_position

    def initialize(
      icon:,
      html_tag: :button,
      theme: :primary,
      size: :base,
      html_attributes: {}
    )
      @icon = icon
      @html_tag = html_tag
      @theme = ButtonComponent::THEMES[theme.to_sym]
      @size = ButtonComponent::SIZES[size.to_sym]
      @icon_size = ICON_SIZES[size.to_sym]
      super(html_attributes:)
    end

    def call
      content_tag(html_tag, **wrapper_attributes) do
        icon_component(icon:, size: icon_size)
      end
    end

    private

    def default_html_attributes
      concat_html_attributes(super, {
        data: {
          size:, theme:, type: :button,
        },
        class: [BUTTON_CLASSES, SIZE_CLASSES, ButtonComponent::THEME_CLASSES].join(" "),
      })
    end
  end
end
