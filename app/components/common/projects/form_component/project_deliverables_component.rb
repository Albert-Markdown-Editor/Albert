# frozen_string_literal: true

module Common
  class Projects::FormComponent::ProjectDeliverablesComponent < Common::MultistepFormComponent::StepComponent
    class << self
      def title = "Project Deliverables"

      def input_attributes = %w[deliverables]
    end

    def call
      tag.p("Project Deliverables")
    end
  end
end
