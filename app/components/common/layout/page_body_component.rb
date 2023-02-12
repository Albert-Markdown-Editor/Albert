# frozen_string_literal: true

module Common
  module Layout
    class PageBodyComponent < ApplicationComponent
      def call
        tag.div(**wrapper_attributes) do

        end
      end

      def default_html_attributes
        concat_html_attributes(super, {
          class: "flex-1"
        })
      end
    end
  end
end
