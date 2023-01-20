# frozen_string_literal: true

module ProjectDeliverables
  module IndexComponent
    class DeliverableComponent < ApplicationComponent
      with_collection_parameter :deliverable

      attr_reader :deliverable

      def initialize(deliverable:, html_attributes: {})
        @deliverable = deliverable
        super(html_attributes:)
      end

      def call
        tag.div do
          tag.p("This is a deliverable")
        end
      end
    end
  end
end
