# frozen_string_literal: true

module Projects
  class IndexComponent < ApplicationComponent
    attr_reader :projects

    def initialize(projects:, custom_html_attributes: {})
      @projects = projects
      super(custom_html_attributes:)
    end

    def call
      tag.div do
        concat(render(FilterComponent.new))
        concat(tag.div(class: "divide-y") { render(ProjectComponent.with_collection(projects)) })
      end
    end
  end
end
