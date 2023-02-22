# @label Tooltip Component
class Common::TooltipComponentPreview < ViewComponent::Preview
  # Tailwind Component
  # ---------------------
  # Displays TailwindCSS template classes.
  def default
    render Common::TooltipComponent.new do |t|
      t.with_trigger do
        tag.p("Tooltip Trigger", class: "w-fit px-6 py-3 bg-gray-600 hover:bg-gray-800 transition-colors duration-400 text-white cursor-pointer")
      end

      t.with_body do
        tag.p("Tooltip Content", class: "w-fit px-4 py-1 text-white")
      end
    end
  end
end
