# frozen_string_literal: true

class ProjectDocumentsController < ApplicationController
  include ProjectSetters
  include WithSlugRoutes

  before_action :set_project_documents_with_slug, only: %i[index]
  before_action :set_project_document_with_slug, only: %i[show]

  # GET /projects/<project_name>/documents
  def index
  end

  # GET /projects/<project_name>/documents/<document_name>
  def show
  end
end
