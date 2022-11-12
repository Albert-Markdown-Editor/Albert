# frozen_string_literal: true

# Base project component class
class ApplicationComponent < ViewComponent::Base
  # Unique component CSS class name
  class << self
    def component_class
      name.split("::").map(&:underscore).join("-")
    end

    # Default component HTML attributes
    def default_html_attributes
      {
        class: [default_css_classes, component_class].join(" "),
        style: default_css_style,
      }
    end

    # Default component HTML class attibute
    def default_css_classes
      ""
    end

    # Default component HTML style attibute
    def default_css_style
      ""
    end
  end

  attr_reader :wrapper_attributes

  delegate :component_class, :default_html_attributes, :default_css_classes, :default_css_style, to: :class

  def initialize(html_attributes: {})
    @wrapper_attributes = concat_html_attributes(html_attributes)
    super
  end

  private

  def concat_html_attributes(html_attributes)
    return default_html_attributes if html_attributes.blank?

    default_html_attributes.merge(html_attributes)
  end
end
