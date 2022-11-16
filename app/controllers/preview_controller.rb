# frozen_string_literal: true

# Controller used by ViewComponent & Lookbook previews
class PreviewController < ViewComponentsController
  include FilterableController

  # Defined for preview compatibility with filter components
  def filter_params = {}
end
