# frozen_string_literal: true

module ProjectDeliverables
  class IndexComponent::DeliverableComponent < ApplicationComponent
    with_collection_parameter :deliverable

    attr_reader :deliverable

    def initialize(deliverable:, html_attributes: {})
      @deliverable = deliverable
      super(html_attributes:)
    end
  end
end
