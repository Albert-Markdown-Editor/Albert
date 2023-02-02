# frozen_string_literal: true

module Common
  class Projects::FormComponent::ProjectDeliverablesComponent < Common::MultistepFormComponent::StepComponent
    class << self
      def title = "Project Deliverables"

      def input_attributes = %w[books.title]
    end

    def call
      tag.div(**wrapper_attributes) do
        form.fields_for :books, Book.new do |document_form|
          concat(
            tag.div(class: "flex flex-col gap-2") do
              concat(document_form.label(:title, "Book Title", class: "text-sm"))
              concat(document_form.text_field(:title, class: "px-2 py-1 outline-none border-b-2 border-zinc-300 hover:border-slate-500 focus:border-slate-500"))
              form.object.errors.full_messages_for("books.title".to_sym).each do |m|
                concat(tag.p(m, class: "text-sm text-red-500"))
              end
            end
          )
          concat(
            tag.div(class: "flex flex-col gap-2") do
              concat(document_form.label(:summary, "Book Summary", class: "text-sm"))
              concat(document_form.text_field(:summary, class: "px-2 py-1 outline-none border-b-2 border-zinc-300 hover:border-slate-500 focus:border-slate-500"))
              form.object.errors.full_messages_for("books.summary".to_sym).each do |m|
                concat(tag.p(m, class: "text-sm text-red-500"))
              end
            end
          )
        end
      end
    end

    private

    def default_html_attributes
      concat_html_attributes(super, { class: "flex flex-col gap-4" })
    end
  end
end
