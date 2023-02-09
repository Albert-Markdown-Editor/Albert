# @label IndexComponent
class Projects::IndexComponentPreview < ViewComponent::Preview
  def self.sample_projects
    @@sample_projects ||= Project.limit(10)
  end

  def default
    projects = self.class.sample_projects
    render(Projects::IndexComponent.new(projects:, html_attributes: {}))
  end
end
