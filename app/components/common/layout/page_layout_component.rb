# frozen_string_literal: true

module Common
  module Layout
    class PageLayoutComponent < ApplicationComponent
      def call
        tag.div(**wrapper_attributes) do
          concat(render(Common::Layout::SidebarComponent.new))
          concat(render(Common::Layout::PageBodyComponent.new))
        end
      end

      def default_html_attributes
        concat_html_attributes(super, {
          class: "h-full w-full inline-flex"
        })
      end
    end
  end
end
