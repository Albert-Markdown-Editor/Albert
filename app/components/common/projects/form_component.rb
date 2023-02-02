# frozen_string_literal: true

module Common
  class Projects::FormComponent < Common::MultistepFormComponent
    class << self
      def steps = [ProjectDetailsComponent, ProjectDeliverablesComponent]
    end

    def call
      tag.div(class: "font-primary min-w-[700px] inline-flex gap-4") do
        concat(tag.div(super, class: "flex-grow"))
        concat(render Projects::FormComponent::ProjectPreviewComponent.new(project: model))
      end
    end

    def step_wrapper(step, index, html_attributes: {}, &content)
      options = { class: "group" }

      options = concat_html_attributes(options, { "aria-current": "step" }) if (index + 1) == current_step

      tag.div(**options) do
        concat(
          tag.div(class: "
            w-full inline-flex items-center px-4 py-2 gap-4 border-2 text-zinc-500 border-zinc-500
            group-aria-[current=step]:bg-zinc-500 group-aria-[current=step]:text-white
          ") do
            concat(tag.p(index + 1, class: "h-6 w-6 text-center rounded-full text-white bg-zinc-500"))
            concat(tag.p(step.title))
          end
        )
        concat(
          tag.div(
            class: "
              overflow-hidden h-0 p-0
              group-aria-[current=step]:h-auto group-aria-[current=step]:px-4 group-aria-[current=step]:py-6
            "
          ) do
            concat(tag.div(&content))
            concat(
              tag.div(class: "mt-5 w-full inline-flex gap-2 items-center justify-end") do
                concat(tag.p("cancel", class: "px-4 py-2 bg-zinc-500 text-white")) if current_step == 0
                concat(tag.p("previous", class: "px-4 py-2 bg-zinc-500 text-white")) if current_step > 0
                concat(form.submit("next", class: "px-4 py-2 bg-zinc-500 text-white")) if current_step < steps.count
                concat(form.submit("create project", class: "px-4 py-2 bg-zinc-500 text-white")) if current_step == steps.count
              end
            )
          end
        )
      end
    end
  end
end
