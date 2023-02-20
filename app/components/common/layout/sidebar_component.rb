# frozen_string_literal: true

module Common
  module Layout
    class SidebarComponent < ApplicationComponent
      def call
        tag.div(**wrapper_attributes) do
          concat(logo)
          concat(separator)

          # Read Options
          concat(sidebar_icon_link("newspaper"))
          concat(sidebar_icon_link("bookmark"))
          concat(separator)

          # Edition Options
          concat(sidebar_icon_link("edit"))
          concat(sidebar_icon_link("folder"))
          concat(sidebar_icon_link("stats"))
        end
      end

      def logo
        tag.div(class: "relative w-10 h-10 flex items-center justify-center rounded-full bg-gray-800") do
          concat(tag.p("M", class: "text-xl text-white font-bold"))
          concat(tag.div(class: "absolute top-5 w-[60%] h-[2px] bg-white"))
        end
      end

      def separator
        tag.div(class: "w-[60%] h-[1px] bg-gray-800")
      end

      def sidebar_icon_link(icon)
        tag.div(class: "flex items-center justify-center") do
          icon_component(icon:, size: "xl", html_attributes: { class: "cursor-pointer stroke-gray-400 hover:stroke-gray-800" })
        end
      end

      def default_html_attributes
        concat_html_attributes(super, {
          class: "w-16 flex flex-col items-center gap-4"
        })
      end
    end
  end
end
