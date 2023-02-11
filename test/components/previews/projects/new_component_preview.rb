# @label New
class Projects::NewComponentPreview < ViewComponent::Preview
  def self.sample_project
    @@project = Project.new
  end

  def default
    project = self.class.sample_project
    render(Projects::NewComponent.new(project:, html_attributes: {}))
  end
end
