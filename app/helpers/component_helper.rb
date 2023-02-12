# frozen_string_literal: true

module ComponentHelper
  def icon_component(icon:, size:, html_attributes: {})
    render(Common::IconComponent.new(icon, size:, html_attributes:))
  end
end
