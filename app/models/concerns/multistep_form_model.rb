# frozen_string_literal: true

# Concern used by all +models+ whose creation / edition form use a +MultistepFormComponent+.
# This concern adds a set of virtual attributes to our models, and a validation for them.
#
# The +current_step+ attribute indicates the current step in the multistep form the model went
# through. The +total_steps+ attribute indicates the amount of steps required to complete the
# form. Only when both values match the validation condition will be true.
module MultistepFormModel
  ERROR_ATTRIBUTE = :current_step
  ERROR_DETAIL = :incompleted_multistep_form

  extend ActiveSupport::Concern

  included do
    attr_accessor :current_step, :total_steps

    validate :all_multistep_form_steps_completed,
      if: -> { current_step.present? && total_steps.present? }
  end

  private

  def all_multistep_form_steps_completed? = current_step == total_steps

  def all_multistep_form_steps_completed
    errors.add(ERROR_ATTRIBUTE, ERROR_DETAIL) unless all_multistep_form_steps_completed?
  end
end
