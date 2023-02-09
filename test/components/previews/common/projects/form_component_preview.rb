# @label Form
class Common::Projects::FormComponentPreview < ViewComponent::Preview
  def default
    model = Project.new
    render(Common::Projects::FormComponent.new(form_url: "", back_url: "", model:, html_attributes: {}))
  end

  def project_details_step
    model = Project.new
    render(Common::Projects::FormComponent.new(form_url: "", back_url: "", model:, html_attributes: {}))
  end

  def project_deliverables_step
    model = Project.new(name: "Test Project", current_step: 1)
    render(Common::Projects::FormComponent.new(form_url: "", back_url: "", model:, html_attributes: {}))
  end
end
