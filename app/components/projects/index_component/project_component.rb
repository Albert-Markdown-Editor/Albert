# frozen_string_literal: true

module Projects
  class IndexComponent::ProjectComponent < ApplicationComponent
    attr_reader :project

    with_collection_parameter :project

    def initialize(project:, html_attributes: {})
      @project = project
      super(html_attributes:)
    end
  end
end
