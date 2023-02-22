# frozen_string_literal: true

# Renders Dropdown Component
module Common
  class ButtonComponent < ApplicationComponent
    SIZES = {
      sm: "sm",
      base: "base",
      lg: "lg",
    }.freeze

    THEMES = {
      primary: "primary",
      secondary: "secondary",
      transparent: "transparent",
    }.freeze

    SIZE_CLASSES = "
      data-[size=sm]:px-5 data-[size=sm]:h-8 data-[size=sm]:text-xs data-[size=sm]:gap-2
      data-[size=base]:px-8 data-[size=base]:h-12 data-[size=base]:text-sm data-[size=base]:gap-3
      data-[size=lg]:px-11 data-[size=lg]:h-14 data-[size=lg]:gap-3
    "

    THEME_CLASSES = "
      data-[theme=primary]:text-white data-[theme=primary]:bg-gray-500 data-[theme=primary]:hover:bg-gray-800
      data-[theme=secondary]:text-gray-500 data-[theme=secondary]:border data-[theme=secondary]:border-gray-600
      data-[theme=secondary]:hover:text-white data-[theme=secondary]:hover:border
      data-[theme=secondary]:hover:border-gray-800 data-[theme=secondary]:hover:bg-gray-800
      data-[theme=transparent]:text-gray-500
      data-[theme=transparent]:hover:text-white
      data-[theme=transparent]:hover:border-gray-800 data-[theme=transparent]:hover:bg-gray-800
    "

    BUTTON_CLASSES = "
      w-fit transition-colors duration-400 cursor-pointer inline-flex items-center
    "

    attr_reader :html_tag, :label, :theme, :size, :icon, :icon_position

    def initialize(
      label:,
      html_tag: :button,
      theme: :primary,
      size: :base,
      icon: nil,
      icon_position: nil,
      html_attributes: {}
    )
      @html_tag = html_tag
      @label = label
      @theme = THEMES[theme.to_sym]
      @size = SIZES[size.to_sym]
      @icon = icon
      @icon_positon = icon_position
      super(html_attributes:)
    end

    def call
      content_tag(html_tag, **wrapper_attributes) do
        concat(tag.p(label))
        concat(icon_component(icon:, size:)) if icon.present?
      end
    end

    private

    def default_html_attributes
      concat_html_attributes(super, {
        data: {
          size:, theme:, type: :button,
        },
        class: [BUTTON_CLASSES, SIZE_CLASSES, THEME_CLASSES].join(" "),
      })
    end
  end
end
