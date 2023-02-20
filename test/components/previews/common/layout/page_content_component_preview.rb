# @label Page Content
class Common::Layout::PageContentComponentPreview < ViewComponent::Preview
  def default
    title = "Blogs"
    subtitle = "List of personal blogs"
    back_label = "Back to Projects"
    back_url = "/projects"

    render(Common::Layout::PageContentComponent.new(title:, subtitle:, back_url:, back_label:)) do |component|
      component.body do
        tag.p("PAGE CONTENT BODY", class: "w-full h-full flex items-center justify-center bg-gray-100")
      end
    end
  end
end
