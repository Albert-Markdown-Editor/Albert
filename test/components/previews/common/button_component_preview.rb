# @label Button Component
class Common::ButtonComponentPreview < ViewComponent::Preview
  # Button Component
  # ----------------
  # Displays a button. Only use button component instances to render buttons
  # in the UI. This will ensure all buttons share the same UI designs
  # @param label text
  # @param size select { choices: [sm, base, lg] }
  # @param theme select { choices: [primary, secondary, transparent] }
  def default(label: "Default Button", size: :base, theme: :primary)
    render Common::ButtonComponent.new(label:, size:, theme:)
  end

  # @!group Sizes
  def small
    render Common::ButtonComponent.new(label: "Small Button", size: :sm)
  end

  def base
    render Common::ButtonComponent.new(label: "Base Button", size: :base)
  end

  def large
    render Common::ButtonComponent.new(label: "Large Button", size: :lg)
  end
  # @!endgroup

  # @!group Themes
  def primary
    render Common::ButtonComponent.new(label: "Primary Button", theme: :primary)
  end

  def secondary
    render Common::ButtonComponent.new(label: "Secondary Button", theme: :secondary)
  end

  def transparent
    render Common::ButtonComponent.new(label: "Transparent Button", theme: :transparent)
  end
  # @!endgroup

  # @!group Button with icon
  def small_button_with_icon
    render Common::ButtonComponent.new(label: "Small Button with Icon", size: :sm, icon: "newspaper")
  end

  def base_button_with_icon
    render Common::ButtonComponent.new(label: "Base Button with Icon", size: :base, icon: "newspaper")
  end

  def large_button_with_icon
    render Common::ButtonComponent.new(label: "Large Button with Icon", size: :lg, icon: "newspaper")
  end

  def primary_button_with_icon
    render Common::ButtonComponent.new(label: "Primary Button with Icon", theme: :primary, icon: "newspaper")
  end

  def secondary_button_with_icon
    render Common::ButtonComponent.new(label: "Secondary Button with Icon", theme: :secondary, icon: "newspaper")
  end

  def transparent_button_with_icon
    render Common::ButtonComponent.new(label: "Transparent Button with Icon", theme: :transparent, icon: "newspaper")
  end
  # @!endgroup
end
