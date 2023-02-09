# frozen_string_literal: true
require_relative "../../../component_test_helper"

class Projects::IndexComponentTest < ComponentTestHelper
  def setup
    @component = Projects::IndexComponent
  end

  def test_render_component
    visit_preview(@component)
    assert_selector(".#{@component.component_class}")
  end
end
