# frozen_string_literal: true

# Renders SVG icons and provides additional styling customization options
module Common
  class IconComponent < ApplicationComponent
    ICONS_ASSET_PATH = "icons/"

    SIZES = {
      xs: "xs",
      sm: "sm",
      base: "base",
      lg: "lg",
      xl: "xl",
    }.freeze

    attr_reader :icon, :size

    def initialize(icon, size: :base, html_attributes: {})
      @icon = icon
      @size = SIZES[size.to_sym]
      super(html_attributes:)
    end

    def call
      inline_svg_tag(svg_file, wrapper_attributes)
    end

    def default_html_attributes
      size_classes = "
        data-[size=xs]:w-[12px] data-[size=xs]:h-[12px]
        data-[size=sm]:w-[16px] data-[size=sm]:h-[16px]
        data-[size=base]:w-[20px] data-[size=base]:h-[20px]
        data-[size=lg]:w-[22px] data-[size=lg]:h-[22px]
        data-[size=xl]:w-[28px] data-[size=xl]:h-[28px]
      "

      concat_html_attributes(super, {
        class: size_classes,
        data: { size: },

        # https://github.com/jamesmartin/inline_svg#accessibility
        aria: true,
        aria_hidden: true,
        title: icon,
        desc: "#{icon} icon",
      })
    end

    def svg_file = @svg_file ||= "#{ICONS_ASSET_PATH}#{icon}.svg"
  end
end
