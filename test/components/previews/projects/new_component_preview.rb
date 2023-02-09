# @label New
class Projects::NewComponentPreview < ViewComponent::Preview
  def default
    project = Project.new
    render(Projects::NewComponent.new(project:, html_attributes: {}))
  end
end
