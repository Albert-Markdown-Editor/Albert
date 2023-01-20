# frozen_string_literal: true

module ApplicationHelper
  # Defined here to be available for all views (also ones without view components). Due to
  # ViewComponent restrictions using helpers during initialization, the method is defined
  # as an ApplicationComponent class method and from there as a helper
  def concat_html_attributes(attr1, attr2) = ApplicationComponent.concat_html_attributes(attr1, attr2)
end
