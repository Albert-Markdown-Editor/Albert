require "test_helper"

class ComponentTestHelper < ActionDispatch::IntegrationTest
  def visit_preview(preview_name, **params)
    pp component_path
    visit("/rails/view_components/#{component_path}/#{preview_name}?#{params.to_query}")
  end

  def visit_lookbook_preview(preview_name, **params)
    visit("/internal/docs/lookbook/inspect/#{component_path}/#{preview_name}?#{params.to_query}")
  end

  def component_rendered?
    assert_selector(".#{component.component_class}")
  end

  private

  def component_name = self.class.name.sub("Test", '')

  def component = component_name.constantize

  def component_path = component_name.underscore
end
