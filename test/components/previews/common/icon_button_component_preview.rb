# @label Icon Button Component
class Common::IconButtonComponentPreview < ViewComponent::Preview
  # Icon Button Component
  # ----------------
  # Displays an icon button. Only use icon button component instances to render
  # icon buttons in the UI. This will ensure all buttons share the same UI designs
  # @param icon text
  # @param size select { choices: [sm, base, lg] }
  # @param theme select { choices: [primary, secondary, transparent] }
  def default(icon: "newspaper", size: :base, theme: :primary)
    render Common::IconButtonComponent.new(icon:, size:, theme:)
  end

  # @!group Sizes
  def small
    render Common::IconButtonComponent.new(icon: "newspaper", size: :sm)
  end

  def base
    render Common::IconButtonComponent.new(icon: "newspaper", size: :base)
  end

  def large
    render Common::IconButtonComponent.new(icon: "newspaper", size: :lg)
  end
  # @!endgroup

  # @!group Themes
  def primary
    render Common::IconButtonComponent.new(icon: "newspaper", theme: :primary)
  end

  def secondary
    render Common::IconButtonComponent.new(icon: "newspaper", theme: :secondary)
  end

  def transparent
    render Common::IconButtonComponent.new(icon: "newspaper", theme: :transparent)
  end
  # @!endgroup
end
