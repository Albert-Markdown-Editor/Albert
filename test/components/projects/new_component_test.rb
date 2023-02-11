# frozen_string_literal: true

require "test_helper"

class Projects::NewComponentTest < ViewComponent::TestCase
  def setup
    @component = Projects::NewComponent
  end

  def test_render_component
    render_inline(@component.new(project: Projects::NewComponentPreview.sample_project))
    assert_selector(".#{@component.component_class}")
  end
end
