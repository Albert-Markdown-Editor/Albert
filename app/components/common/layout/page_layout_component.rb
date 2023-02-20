# frozen_string_literal: true

module Common
  module Layout
    class PageLayoutComponent < ApplicationComponent
      class PageBodyComponent < ApplicationComponent
        renders_one :right_topbar
        renders_one :left_topbar
        renders_one :body, ->(html_attributes: {}, &block) do
          default_options = { class: "flex-1" }

          tag.div(**concat_html_attributes(default_options, html_attributes), &block)
        end

        def call
          tag.div(**wrapper_attributes) do
            # Top Header
            concat(
              tag.div(class: "h-10 w-full inline-flex items-center justify-between") do
                concat(left_topbar? ? left_topbar : default_left_topbar)
                concat(right_topbar? ? right_topbar : default_right_topbar)
              end
            )

            # Content
            concat(body)
          end
        end

        def default_right_topbar
          tag.p("")
        end

        def default_left_topbar
          tag.p("Alberto / Projects / Blogs", class: "text-sm text-gray-400")
        end

        def default_html_attributes
          concat_html_attributes(super, {
            class: "flex-1 flex flex-col gap-6 px-10"
          })
        end
      end

      renders_one :page_content, PageBodyComponent

      def call
        tag.div(**wrapper_attributes) do
          concat(render(Common::Layout::SidebarComponent.new))
          concat(page_content)
        end
      end

      def default_html_attributes
        concat_html_attributes(super, {
          class: "h-full w-full inline-flex py-4 pr-6"
        })
      end
    end
  end
end
