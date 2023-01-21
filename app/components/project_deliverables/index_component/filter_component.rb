# frozen_string_literal: true

module ProjectDeliverables
  class IndexComponent::FilterComponent < ApplicationComponent
    delegate :filter_params, to: :helpers

    attr_reader :project

    def initialize(project:, html_attributes: {})
      @project = project
      super(html_attributes:)
    end

    def call
      form_with(url: project_deliverables_path(project), method: :get, class: "px-8 py-6 inline-flex gap-6") do |form|
        concat(
          tag.div(class: "inline-flex gap-4") do
            concat(form.label(:title, "Title"))
            concat(
              form.text_field(
                :name,
                value: filter_params[:title],
                class: "border-b-2 focus:border-slate-400 focus:outline-none"
              )
            )
          end
        )
        concat(
          tag.div(class: "inline-flex gap-4") do
            concat(form.label(:summary, "Summary"))
            concat(
              form.text_field(
                :description,
                value: filter_params[:summary],
                class: "border-b-2 focus:border-slate-400 focus:outline-none"
              )
            )
          end
        )
        concat(
          form.submit
        )
      end
    end
  end
end
