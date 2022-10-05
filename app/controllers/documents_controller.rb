# frozen_string_literal: true

class DocumentsController < ApplicationController
  include DocumentSetters

  before_action :set_document_with_slug, only: [:show]

  # GET /documents
  def index
    @documents = Document.friendly.includes(:project).all
  end

  # GET /documents/<document_name>
  # GET /documents/<project_name>/<document_name>
  def show
  end
end
