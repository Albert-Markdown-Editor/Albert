# frozen_string_literal: true

module Common
  class Projects::FormComponent::ProjectDetailsComponent < Common::MultistepFormComponent::StepComponent
    class << self
      def title = "Project Details"

      def input_attributes = %w[name]
    end

    def call
      tag.div(**wrapper_attributes) do
        concat(
          tag.div(class: "flex flex-col gap-2") do
            concat(form.label(:name, "Project Name"))
            concat(form.text_field(:name, class: "px-2 py-1 outline-none border-b-2 border-zinc-300 hover:border-slate-500 focus:border-slate-500"))
            form.object.errors.full_messages_for(:name).each do |m|
              concat(tag.p(m, class: "text-sm text-red-500"))
            end
          end
        )
        concat(
          tag.div(class: "mt-5 flex flex-col gap-2") do
            concat(form.label(:description, "Description"))
            concat(form.text_field(:description, class: "px-2 py-1 outline-none border-b-2 border-zinc-300 hover:border-slate-500 focus:border-slate-500"))
            form.object.errors.full_messages_for(:description) do |m|
              concat(tag.p(m, class: "text-sm text-red-500"))
            end
          end
        )
      end
    end
  end
end
