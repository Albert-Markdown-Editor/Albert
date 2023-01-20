# frozen_string_literal: true

# Helpers for +ApplicationComponent+ components which
# have a stimulus controller attached to it.
module WithStimulusControllerComponent
  extend ActiveSupport::Concern

  class << self
    # Maps component namespace into +Stimulus+ identifier. Useful to
    # handle +Stimulus+ data attributes associated to a component
    # stimulus controller
    def stimulus_identifier = @csi = css_class_selector
  end
end
