# @label Index
class Projects::IndexComponentPreview < ViewComponent::Preview
  class << self
    def projects
      @projects ||= Project.all
    end
  end

  # Index Component
  # ---------------
  # Encapsulates ProjectsController index view
  def default
    projects = self.class.projects
    render Projects::IndexComponent.new(projects:)
  end
end
