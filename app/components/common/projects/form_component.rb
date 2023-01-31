# frozen_string_literal: true

module Common
  class Projects::FormComponent < Common::MultistepFormComponent
    class << self
      def steps = [ProjectDetailsComponent, ProjectDeliverablesComponent]
    end
  end
end
