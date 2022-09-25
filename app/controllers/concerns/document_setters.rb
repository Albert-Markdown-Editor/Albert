# frozen_string_literal: true

module DocumentSetters
  extend ActiveSupport::Concern

  def set_document
    @document = Document.find(params[:id] || params[:document_id])
  end

  def set_document_with_slug
    @document = Document.friendly.find(params[:id] || params[:document_id])
  end
end
