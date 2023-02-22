# frozen_string_literal: true

# Set of +ViewComponent+ helpers to attach +Stimulus+ data attribute to your DOM elements.
module WithStimulusControllerComponent
  extend ActiveSupport::Concern

  # All +StimulusControllers+ have an +identifier+ based on their file name and how
  # they are loaded in +application.js+ (.js entrypoint for your application). This
  # helper infers the +identifier+ from the component class name & namespace.
  #
  # (!) Make sure the way controllers are named match with the way this method infers
  # the component identifier
  def stimulus_identifier
    self.class.name.underscore.gsub("/", "--").tr("_", "-")
  end

  # Stimulus HTML options to attach stimulus controller to element
  def stimulus_controller_option(controller = stimulus_identifier, html_attributes: {})
    concat_html_attributes({ data: { controller: } }, html_attributes)
  end

  # Stimulus HTML options to attach stimulus target to element
  def stimulus_target_option(target, controller = stimulus_identifier, html_attributes: {})
    concat_html_attributes({ data: { "#{controller}-target": target } }, html_attributes)
  end

  def stimulus_value_option(value_name, value, controller = stimulus_identifier, html_attributes: {})
    concat_html_attributes({ data: { "#{controller}-#{value_name}-value": value.to_json } }, html_attributes)
  end

  def stimulus_controller_attributes(controller = stimulus_identifier, targets = [], values: {}, html_attributes: {})
    options = stimulus_controller_option(controller, html_attributes:)

    targets.each { |t| options = stimulus_target_option(t, html_attributes: options) }

    values.each_pair { |k, v| options = stimulus_value_option(k, v, controller, html_attributes: options) }

    options
  end
end
