# frozen_string_literal: true

module Projects
  class IndexComponent::ProjectComponent < ApplicationComponent
    attr_reader :project

    with_collection_parameter :project

    def initialize(project:, custom_html_attributes: {})
      @project = project
      super(custom_html_attributes:)
    end
  end
end
