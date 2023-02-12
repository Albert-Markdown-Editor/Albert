# frozen_string_literal: true

module Common
  module Layout
    class SidebarComponent < ApplicationComponent
      def call
        tag.div(**wrapper_attributes) do
          concat(logo)
        end
      end

      def logo
        tag.div(class: "w-16 h-16 flex items-center justify-center") do
          tag.p("M")
        end
      end

      def default_html_attributes
        concat_html_attributes(super, {
          class: "w-16 border-r-2 border-gray-800"
        })
      end
    end
  end
end
