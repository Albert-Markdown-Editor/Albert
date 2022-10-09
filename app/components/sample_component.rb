# frozen_string_literal: true

# Base project component class
class SampleComponent < ApplicationComponent
  def call
    pp wrapper_attributes
    tag.div(**wrapper_attributes) do
      concat(tag.h1("Hey There!", class: "font-secondary text-4xl"))
      concat(tag.p("This is an Albert sample component", class: "font-primary"))
      concat(tag.p("I hope you like it!", class: "font-primary font-semibold"))
    end
  end
end
