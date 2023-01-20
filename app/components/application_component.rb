# frozen_string_literal: true

# Base +ViewComponent+ class. Make sure all your components inherit from +ApplicationComponent+.
# The class contains a set helpers to answer common needs when it comes to rendering and testing
# components in your views
class ApplicationComponent < ViewComponent::Base
  class << self
    # Given two hashes representing HTML attributes (class, id, data, ...), the method
    # merges +attr2+ into +attr1+, concatenating string values and overwriting all other
    # values of different type.
    #
    # Use it to combine multiple attributes in your components and views.
    #
    # @param [Hash] attr1
    # @param [Hash] attr2
    # @return [Hash]
    def concat_html_attributes(attr1, attr2)
      return attr1 if attr2.blank?

      result = attr1

      result.tap do
        attr2.each do |k, v|
          result[k] = case v
                      when String then [result.fetch(k, ""), v].compact.join
                      when Hash then concat_html_attributes(result.fetch(k, {}), v)
                      else v
                      end
        end
      end
    end

    # Maps component namespace into a CSS class. By default this
    # class will be present in component +html_attributes+, allowing
    # to easily identify component instances in DOM
    def css_class
      @ccs = name.underscore.dasherize.gsub("/", "--")
    end
  end

  delegate :css_class, :concat_html_attributes, to: :class

  attr_reader :html_attributes

  def initialize(
    custom_html_attributes: {},
    overwrite_html_attributes: false
  )
    @html_attributes = if overwrite_html_attributes
      custom_html_attributes
    else
      concat_html_attributes(default_html_attributes, custom_html_attributes)
    end

    super
  end

  private

  # HTML attributes per component. Rewrite this method in your
  # +ApplicationComponent+ descendants to define set of default
  # attributes all your component instances will display in DOM
  def default_html_attributes = { class: css_class }
end
