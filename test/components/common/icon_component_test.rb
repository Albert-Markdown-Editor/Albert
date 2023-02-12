# frozen_string_literal: true

require "test_helper"

class Common::IconComponentTest < ViewComponent::TestCase
  def setup
    @component = Common::IconComponent
  end

  test "Renders icon component" do
    render_inline(@component.new("edit"))
    assert_selector(".#{@component.component_class}")
  end

  test "Renders icon from SVG file" do
    icon = "edit"
    result = render_inline(@component.new(icon)).to_html
    expected_svg = icon_svg(icon)

    # Compares rendered icon matches with .svg icon file, ignoring the first line (which
    # contains specific .svg configuration set by component initializer options)
    assert_equal result.split("\n")[2..], expected_svg.split("\n")[1..]
  end

  test "Raises exception if specified icon does not have SVG file" do
    assert_raises { render_inline(@component.new("invalid icon")) }
  end

  private

  # Extracts SVG definition from .svg file
  def icon_svg(icon)
    asset = Rails.application.assets.find_asset(Common::IconComponent.new(icon).svg_file)
    svg_element = Nokogiri::HTML::DocumentFragment.parse(asset.source.force_encoding("UTF-8"))
    svg_element.to_html
  end
end
