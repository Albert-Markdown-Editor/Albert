# frozen_string_literal: true

# Renders Tailwind Config Viewer HTML
module Editor
  module Common
    class DocumentComponent < ApplicationComponent
      attr_reader :document

      def initialize(document:, html_attributes: {})
        @document = document
        super(html_attributes:)
      end

      def call
        tag.div(**wrapper_attributes) do
          render DocumentFragmentComponent.with_collection(document.document_fragments)
        end
      end

      private

      def default_html_attributes
        super.merge({ contenteditable: true })
      end

      def default_css_classes
        "prose prose-slate mx-auto lg:prose-lg"
      end
    end
  end
end
