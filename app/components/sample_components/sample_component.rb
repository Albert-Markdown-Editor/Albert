# frozen_string_literal: true

# Example of Albert ViewComponent with basic configuration
class SampleComponents::SampleComponent < ApplicationComponent
  def call
    tag.div(**html_attributes) do
      concat(tag.h1("Hey There!", class: "font-secondary text-4xl"))
      concat(tag.p("This is an Albert sample component", class: "font-primary"))
      concat(tag.p("I hope you like it!", class: "font-primary font-semibold"))
    end
  end

  private

  def component_html_attributes
    {
      class: "px-8 py-6 rounded border"
    }
  end
end
