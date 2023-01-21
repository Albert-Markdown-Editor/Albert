# frozen_string_literal: true

class ProjectDeliverablesController < ApplicationController
  include ProjectSetters
  include WithSlugRoutes
  include FilterableController

  before_action :set_project_with_slug, only: %i[index]
  before_action :set_project_deliverables_with_slug, only: %i[index]

  # GET /projects/<project_name>/deliverables
  def index
    @deliverables = filter(@deliverables)
  end

  private

  def filter_params
    {
      title: params["title"],
      summary: params["summary"],
    }
  end
end
