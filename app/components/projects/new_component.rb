# frozen_string_literal: true

module Projects
  class NewComponent < ApplicationComponent
    attr_reader :project

    def initialize(project:, html_attributes: {})
      @project = project
      super(html_attributes:)
    end

    def call
      render Common::Projects::FormComponent.new(
        form_url: projects_path(project),
        back_url: projects_path,
        model: project,
        html_attributes: wrapper_attributes
      )
    end
  end
end
