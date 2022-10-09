# frozen_string_literal: true

module DocumentSetters
  extend ActiveSupport::Concern

  def set_documents
    @projects = Document.all
  end

  def set_document
    @document = Document.find(document_param)
  end

  def set_document_with_slug
    @document = Document.friendly.find(document_param)
  end

  private

  def document_param
    params[:document_id] || params[:id]
  end
end
