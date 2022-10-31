# frozen_string_literal: true

# Extend this concern in your models to make them filterable. Filterable
# models require their corresponding FilterProxy class to be defined under
# /concerns/filters to work
module Filterable
  extend ActiveSupport::Concern

  def filter_proxy
    @filter_proxy ||= filter_proxy_class_name.constantize
  rescue NameError
    raise "
      Model #{name} including Filterable concern requires #{filter_proxy_class_name} filter proxy
      class to be defined. Please make sure class is defined as a filter proxy and that the name
      of the class corresponds to the name of the model
    "
  end

  delegate :filter_by, to: :filter_proxy

  private

  def filter_proxy_class_name
    "#{Filters::FilterProxy::FILTER_PROXY_NAMESPACE}::#{name}#{Filters::FilterProxy::FILTER_PROXY_SUFIX}"
  end
end
