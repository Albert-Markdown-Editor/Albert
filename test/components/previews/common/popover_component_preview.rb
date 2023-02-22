# @label Popover Component
class Common::PopoverComponentPreview < ViewComponent::Preview
  # Popover Component
  # ---------------------
  # Displays a popover component. Uses Tippy.js in the background.
  # Use the popover component to create similar components such as
  # tooltips or dropdowns, which relay in the same show/hide mechanism
  # of this component
  def default
    render Common::PopoverComponent.new do |p|
      p.with_trigger do
        tag.p("Popover Trigger", class: "w-fit px-6 py-3 bg-gray-600 hover:bg-gray-800 transition-colors duration-400 text-white cursor-pointer")
      end

      p.with_body do
        tag.p("Popover Content", class: "w-fit px-4 py-1 text-white")
      end
    end
  end
end
