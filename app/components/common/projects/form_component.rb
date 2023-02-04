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
      selected = index == current_step_index

      options = (selected ? { "aria-current": "step" } : {})

      super(step, index, html_attributes: options) do
        concat(
          tag.label(
            for: index <= current_step_index ? radio_id(index) : "",
            class: "
              w-full inline-flex items-center px-4 py-2 gap-4 border-2 text-zinc-500 border-zinc-500
              peer-checked/radio:bg-zinc-500 peer-checked/radio:text-white
            "
          ) do
            concat(tag.p(index + 1, class: "h-6 w-6 text-center rounded-full text-white bg-zinc-500"))
            concat(tag.p(step.title))
          end
        )
        concat(
          tag.div(
            class: "
              overflow-hidden h-0 p-0
              peer-checked/radio:h-auto peer-checked/radio:px-4 peer-checked/radio:py-6
            "
          ) do
            concat(capture(&content))
            concat(
              tag.div(class: "mt-5 w-full inline-flex gap-2 items-center justify-end") do
                concat(link_to("cancel", projects_path, class: "px-4 py-2 bg-zinc-500 text-white")) if index == 0
                concat(tag.label("previous", for: radio_id(index - 1), class: "px-4 py-2 bg-zinc-500 text-white")) if index > 0
                concat(form.submit("next", class: "cursor-pointer px-4 py-2 bg-zinc-500 text-white")) if index < (steps.count - 1)
                concat(form.submit("create project", class: "cursor-pointer px-4 py-2 bg-zinc-500 text-white")) if index == (steps.count - 1)
              end
            )
          end
        )
      end
    end
  end
end
