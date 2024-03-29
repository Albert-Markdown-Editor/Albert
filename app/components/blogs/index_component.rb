# frozen_string_literal: true

module Blogs
  class IndexComponent < ApplicationComponent
    attr_reader :blogs

    def initialize(blogs:, html_attributes: {})
      @blogs = blogs
      super(html_attributes:)
    end

    def call
      title = "Blogs"
      subtitle = "List of personal blogs"
      back_label = "Back to Projects"
      back_url = projects_path

      render(Common::Layout::PageLayoutComponent.new) do |layout|
        layout.page_content do |page_content|
          page_content.body do
            render(Common::Layout::PageContentComponent.new(title:, subtitle:, back_url:, back_label:)) do |component|
              component.with_right_content do
                button_component(label: "Create New Blog", icon: "plus")
              end

              component.body do
                tag.p("PAGE CONTENT BODY", class: "w-full h-full flex items-center justify-center bg-gray-100")
              end
            end
          end
        end
      end
    end
  end
end
