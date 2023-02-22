# frozen_string_literal: true

require "test_helper"

class Common::IconButtonComponentTest < ViewComponent::TestCase
  def setup
    @component = Common::IconButtonComponent
  end

  def test_render_component
    render_inline(@component.new(icon: "newspaper"))
    assert_selector(".#{@component.component_class}")
  end
end
