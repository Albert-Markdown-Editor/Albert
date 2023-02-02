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

  # GET /projects/new
  def new
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if(@project.save)
      redirect_to project_path(@project), notice: "Project created"
    end
  end

  # GET /projects/<project_name>/edit
  def edit
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

  def project_params
    params
      .require(:project)
      .permit(:name, :description, :total_steps, :current_step, books_attributes: [:title, :description])
  end
end
