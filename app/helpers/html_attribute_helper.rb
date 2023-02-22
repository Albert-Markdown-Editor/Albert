# frozen_string_literal: true

# Set of methods to handle HTML tag attributes
module HtmlAttributeHelper
  # Turns +ApplicationComponent+ +concat_html_attributes+ method into a helper. This is done to be able
  # to use this helper in other helper methods. Since helpers can not be invoked during component
  # initialization, we leave the original method definition in the application class
  def concat_html_attributes(old_html_attributes, new_html_attributes)
    ApplicationComponent.concat_html_attributes(old_html_attributes, new_html_attributes)
  end
end
