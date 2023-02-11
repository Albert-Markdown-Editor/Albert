require "test_helper"

class ApplicationLayoutComponentTest < ViewComponent::TestCase
  def setup
    @component = Layout::ApplicationLayoutComponent
  end

  def test_render_component
    render_inline(@component.new)
    assert_selector(".#{@component.component_class}")
  end
end
