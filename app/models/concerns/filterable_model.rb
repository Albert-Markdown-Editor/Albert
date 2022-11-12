# frozen_string_literal: true

# Extend this concern in your models to make them filterable. FilterableModel
# models require their corresponding FilterProxy class to be defined under
# /concerns/filters to work
module FilterableModel
  extend ActiveSupport::Concern

  def filter_proxy
    raise "
      Model #{name} including FilterableModel concern requires filter_proxy method to be defined.
      Method should return filter proxy class associated to model.
    "
  end

  delegate :filter_by, to: :filter_proxy
end
