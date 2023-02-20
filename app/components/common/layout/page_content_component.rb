# frozen_string_literal: true

module Common
  module Layout
    class PageContentComponent < ApplicationComponent
      attr_reader :title, :subtitle, :back_label, :back_url

      renders_one :right_content
      renders_one :left_content

      renders_one :body, ->(html_attributes: {}, &block) do
        default_options = { class: "flex-1" }

        tag.div(**concat_html_attributes(default_options, html_attributes), &block)
      end

      def initialize(title:, subtitle:, back_label:, back_url:, html_attributes: {})
        @title = title
        @subtitle = subtitle
        @back_url = back_url
        @back_label = back_label
        super(html_attributes:)
      end

      def call
        tag.div(**wrapper_attributes) do
          # Header
          concat(
            tag.div(class: "w-full inline-flex items-center justify-between") do
              concat(
                tag.div do
                  concat(header)
                  concat(left_content)
                end
              )
              concat(right_content)
            end
          )

          # Content
          concat(body)
        end
      end

      def header
        tag.div do
          concat(
            link_to(back_url, class: "inline-flex items-center gap-2 text-xs text-gray-400") do
              concat(icon_component(icon: "arrow-left", size: :base, html_attributes: { class: "stroke-gray-400" }))
              concat(tag.p(back_label))
            end
          )
          concat(tag.h1(title, class: "text-3xl font-bold text-gray-800"))
          concat(tag.h2(subtitle, class: "mt-1.5 text-sm text-gray-800"))
        end
      end

      def default_html_attributes
        concat_html_attributes(super, {
          class: "h-full w-full space-y-6 flex flex-col"
        })
      end
    end
  end
end
