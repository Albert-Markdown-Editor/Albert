# frozen_string_literal: true

require "test_helper"

class Common::ButtonComponentTest < ViewComponent::TestCase
  def setup
    @component = Common::ButtonComponent
  end

  def test_render_component
    render_inline(@component.new(label: "test button"))
    assert_selector(".#{@component.component_class}")
  end
end
