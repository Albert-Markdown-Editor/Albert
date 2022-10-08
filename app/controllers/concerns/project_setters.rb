# frozen_string_literal: true

module ProjectSetters
  extend ActiveSupport::Concern

  def set_projects
    @projects = Project.all
  end

  def set_project
    @project = Project.find(project_param)
  end

  def set_project_with_slug
    @project = Project.friendly.find(project_param)
  end

  private

  def project_param
    params[:project_id] || params[:id]
  end
end
