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

  def set_projects_documents
    @documents = Project.find(project_param).documents
  end

  def set_project_documents_with_slug
    @documents = Project.friendly.find(project_param).documents
  end

  def set_project_document
    @documents = Project.find(project_param).documents.find(document_param)
  end

  def set_project_document_with_slug
    @document = Project.friendly.find(project_param).documents.friendly.find(document_param)
  end

  def set_projects_deliverables
    @deliverables = Project.find(project_param).deliverables
  end

  def set_project_deliverables_with_slug
    @deliverables = Project.friendly.find(project_param).deliverables
  end

  private

  def project_param
    params[:project_id] || params[:id]
  end

  def document_param
    params[:document_id] || params[:id]
  end
end
