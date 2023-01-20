# frozen_string_literal: true

class ProjectDeliverablesController < ApplicationController
  include ProjectSetters
  include WithSlugRoutes

  before_action :set_project_with_slug, only: %i[index]
  before_action :set_project_documents_with_slug, only: %i[index]

  # GET /projects/<project_name>/deliverables
  def index
  end
end
