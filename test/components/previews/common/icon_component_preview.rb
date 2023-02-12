# @label Icon Component
class Common::IconComponentPreview < ViewComponent::Preview
  # Icon Component
  # --------------
  # Renders an `.svg` component from the icon assets library available
  # at `/assets/images/icons`. You can pass additional `HTML` parameters
  # to customize your icons the way you want
  #
  # @param icon
  # @param size select { choices: [xs, sm, base, lg, xl] }
  def default(icon: :edit, size: :xl)
    render Common::IconComponent.new(icon.to_sym, size:)
  end

  # Icons Collection
  # ----------------
  # List of all icons available in system. You can click on any icon to
  # copy in your clipboard the helper method to render the selected icon.
  #
  # @param size select { choices: [xs, sm, base, lg, xl] }
  def icons(size: :base)
    render_with_template(locals: { size: size })
  end
end
