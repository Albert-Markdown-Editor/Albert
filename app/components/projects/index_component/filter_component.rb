# frozen_string_literal: true

module Projects
  class IndexComponent::FilterComponent < ApplicationComponent
    delegate :filter_params, to: :helpers

    def call
      form_with(url: projects_path, method: :get, class: "px-8 py-6 inline-flex gap-6") do |form|
        concat(
          tag.div(class: "inline-flex gap-4") do
            concat(form.label(:name, "Name"))
            concat(
              form.text_field(
                :name,
                value: filter_param(:name),
                class: "border-b-2 focus:border-slate-400 focus:outline-none"
              )
            )
          end
        )
        concat(
          tag.div(class: "inline-flex gap-4") do
            concat(form.label(:description, "Description"))
            concat(
              form.text_field(
                :description,
                value: filter_param(:description),
                class: "border-b-2 focus:border-slate-400 focus:outline-none"
              )
            )
          end
        )
        concat(
          form.submit
        )
      end
    end

    private

    def filter_param(name)
      (filter_params.blank? ? params : filter_params).fetch(name, "")
    end
  end
end
