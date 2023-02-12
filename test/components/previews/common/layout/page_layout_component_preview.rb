# @label Page Layout
class Common::Layout::PageLayoutComponentPreview < ViewComponent::Preview
  def default
    render(Common::Layout::PageLayoutComponent.new)
  end
end
