# frozen_string_literal: true

module ComponentHelper
  def icon_component(icon:, size: :base, html_attributes: {})
    render(Common::IconComponent.new(icon, size:, html_attributes:))
  end

  def button_component(label:, size: :base, theme: :primary, icon: nil, html_attributes: {})
    render(Common::ButtonComponent.new(label:, size:, theme:, icon:, html_attributes:))
  end

  def icon_button_component(icon:, size: :base, theme: :primary, html_attributes: {})
    render(Common::IconButtonComponent.new(icon:, size:, theme:, html_attributes:))
  end
end
