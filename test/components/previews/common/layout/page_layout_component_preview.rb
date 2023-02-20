# @label Page Layout
class Common::Layout::PageLayoutComponentPreview < ViewComponent::Preview
  def default
    render(Common::Layout::PageLayoutComponent.new) do |layout|
      layout.with_page_content do |page_content|
        page_content.with_body do
          tag.p("PAGE LAYOUT BODY", class: "w-full h-full flex items-center justify-center bg-gray-100")
        end
      end
    end
  end
end
