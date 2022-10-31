# frozen_string_literal: true

# Extend this concern in your +FilterScope+ modules to enable the
# use of the custom +filter_scope+ scope method for filters
module FilterScopeable
  extend ActiveSupport::Concern

  # Replicates the +scope+ ActiveRecord class method for filters proxies.
  # All filter scopes defined by this method wont apply their filter query
  # to the scope if the value of the filter is blank
  def filter_scope(name, block)
    define_method(name) do |filter_value|
      return self if filter_value.blank?

      instance_exec(filter_value, &block)
    end
  end
end
