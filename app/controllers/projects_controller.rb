# frozen_string_literal: true

class ProjectsController < ApplicationController
  include ProjectSetters

  before_action :set_projects, only: [:show]
  before_action :set_project_with_slug, only: [:show]

  # GET /projects
  def index
    @projects = Project.all
  end

  def show
  end
end
