# @label Sample Component
class SampleComponents::SampleComponentPreview < ViewComponent::Preview
  # Application Component
  # ---------------------
  # Abstract component to be inherited by the rest of components in project.
  def default
    render SampleComponents::SampleComponent.new
  end
end
