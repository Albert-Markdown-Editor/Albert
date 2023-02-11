# frozen_string_literal: true

require "test_helper"

class Common::TailwindComponentTest < ViewComponent::TestCase
  def setup
    @component = Common::TailwindComponent
  end

  def test_render_component
    render_inline(@component.new)
    assert_selector(".#{@component.component_class}")
  end
end
