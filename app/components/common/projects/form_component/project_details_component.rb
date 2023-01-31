# frozen_string_literal: true

module Common
  class Projects::FormComponent::ProjectDetailsComponent < Common::MultistepFormComponent::StepComponent
    class << self
      def title = "Project Deliverables"
    end

    def call
      concat(tag.p("Project Details"))
    end
  end
end
