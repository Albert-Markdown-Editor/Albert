# frozen_string_literal: true

# Set of helpers for generating +Stimulus+ data HTML attributes.
# Use this in combination with components to have a better control
# of your Stimulus controllers in your views.
module StimulusHelper
  def stimulus_action_value(identifier, event, action) = "#{event}->#{identifier}##{action}"

  def stimulus_target_key(identifier) = "data-#{identifier}-target"

  def stimulus_css_class_key(identifier, css_class) = "data-#{identifier}-#{css_class}-class"

  def stimulus_value_key(identifier, value_name) = "data-#{identifier}-#{value_name}-value"

  def stimulus_controller_attributes(identifier, values: {}, css_classes: {}, html_attributes: {})
    result = html_attributes

    result.tap do |attrs|
      attrs[:controller] = [html_attributes.fetch(:controller, nil), identifier].compact.join(" ")
      values.each { |k, v| attrs[stimulus_value_key(identifier, k)] = v } unless values.empty?
      css_classes.each { |k, v| attrs[stimulus_css_class_key(identifier, k)] = v } unless css_classes.empty?
    end
  end

  def stimulus_target_attribute(identifier, target, html_attributes: {})
    result = html_attributes

    result.tap { |attrs| attrs[stimulus_target_key(identifier)] = target }
  end

  def stimulus_action_attribute(identifier, event, action, html_attributes: {})
    result = html_attributes

    result.tap do |attrs|
      attrs[:actions] = [
        html_attributes.fetch(:actions, nil),
        stimulus_action_value(identifier, event, action),
      ].compact.join(" ")
    end
  end
end
