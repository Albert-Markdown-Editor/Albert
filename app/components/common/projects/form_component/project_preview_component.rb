# frozen_string_literal: true

module Common
  class Projects::FormComponent::ProjectPreviewComponent < ApplicationComponent
    attr_reader :project

    def initialize(project:, html_attributes: {})
      @project = project
      super(html_attributes:)
    end

    def call
      tag.div(class: "flex flex-col gap-4") do
        concat(tag.h1("Project Information", class: "text-xl font-semibold"))
        concat(preview_field(:name, project.name)) if project.name.present?
        concat(preview_field(:description, project.description)) if project.description.present?
      end
    end

    def preview_field(field_name, field_value)
      tag.div(class: "flex flex-col gap-1") do
        concat(tag.p(field_name, class: "text-sm font-semibold"))
        concat(tag.p(field_value))
      end
    end
  end
end
