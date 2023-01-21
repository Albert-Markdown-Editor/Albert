# frozen_string_literal: true

module ProjectDeliverables
  class IndexComponent < ApplicationComponent
    attr_reader :project, :deliverables

    def initialize(project:, deliverables:, html_attributes: {})
      @project = project
      @deliverables = deliverables
      super(html_attributes:)
    end

    def call
      tag.div do
        concat(
          render(FilterComponent.new(project:))
        )
        concat(
          tag.div(class: "divide-y") { concat(render(DeliverableComponent.with_collection(deliverables))) }
        )
      end
    end
  end
end
