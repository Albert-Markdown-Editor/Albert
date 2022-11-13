# frozen_string_literal: true

# Base project component class
class ApplicationComponent < ViewComponent::Base
  class << self
    def component_name
      @cn ||= name.underscore
    end

    def component_class_name
      @ccn ||= component_name.dasherize.gsub("/", "__")
    end

    def component_stimulus_controller_name
      @cscn = component_name.dasherize.gsub("/", "--")
    end
  end

  delegate :component_name, :component_class_name, :component_stimulus_controller_name, to: :class

  attr_reader :html_attributes, :with_controller

  def initialize(
    custom_html_attributes: {},
    overwrite_html_attributes: false,
    with_controller: false
  )
    @html_attributes = overwrite_html_attributes ? custom_html_attributes : concat_html_attributes(custom_html_attributes)
    @with_controller = with_controller
    super
  end

  private

  def concat_html_attributes(custom_attrs, previous_attrs = default_html_attributes)
    return previous_attrs if custom_attrs.blank?

    custom_attrs.each_key do |k|
      if custom_attrs[k].is_a? String
        previous_attrs[k] = [previous_attrs.fetch(k, ""), custom_attrs[k]].join(" ")
      elsif custom_attrs[k].is_a? Hash
        previous_attrs[k] = concat_html_attributes(custom_attrs[k], previous_attrs.fetch(k, {}))
      else
        previous_attrs[k] = custom_attrs[k]
      end
    end

    previous_attrs
  end

  # Overwrite this method in your component to set custom classes and
  # other HTML attributes. Hash will be merged with default HTML
  # attributes and custom HTML attributes provided to component during
  # initialization
  def component_html_attributes = {}

  # Set of default HTML attributes for all components.
  # Assigned by application component initializer
  def default_html_attributes
    data = {}
    data["component-name"] = component_name
    data["controller"] = component_stimulus_controller_name if with_controller

    concat_html_attributes(component_html_attributes, { class: component_class_name, data: })
  end
end
