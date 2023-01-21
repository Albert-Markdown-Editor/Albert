# frozen_string_literal: true

class ProjectDeliverable < ApplicationRecord
  class << self
    def compatible_kinds = %w[Book BlogPost]

    def filter_proxy = Filters::ProjectDeliverableFilterProxy
  end

  extend FilterableModel
  include ViewBasedModel
end
