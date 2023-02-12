# frozen_string_literal: true

# Renders SVG icons and provides additional styling customization options
module Common
  class IconComponent < ApplicationComponent
    ICONS_ASSET_PATH = "icons/"

    SIZES = {
      xs: "w-[12px]",
      sm: "w-[14px]",
      base: "w-[16px]",
      lg: "w-[18px]",
      xl: "w-[20px]",
    }.freeze

    attr_reader :icon, :size

    def initialize(icon, size: :base, html_attributes: {})
      @icon = icon
      @size = size
      super(html_attributes:)
    end

    def call
      inline_svg_tag(svg_file, wrapper_attributes)
    end

    def default_html_attributes
      concat_html_attributes(super, {
        class: SIZES[size.to_sym],

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
