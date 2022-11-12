# frozen_string_literal: true

class ProjectsController < ApplicationController
  include ProjectSetters
  include WithSlugRoutes
  include FilterableController

  before_action :set_projects, only: [:index]
  before_action :set_project_with_slug, only: [:show]

  # GET /projects
  def index
    @projects = filter(@projects)
  end

  # GET /projects/<project_name>
  def show
    redirect_to_url_with_active_slug if request_with_deprecated_slug?
  end

  private

  # WithSlugRoutes resource identifier
  def slug_resource = @project

  def filter_params
    {
      name: params["name"],
      description: params["description"],
    }
  end
end
