# frozen_string_literal: true

module Filters
  module DocumentFilterScopes
    extend FilterScopeable

    filter_scope :name, ->(name) { where("name ILIKE ?", "%#{name}%") }
    filter_scope :status, ->(status) { where(status:) }
  end

  class DocumentFilterProxy < FilterProxy
  end
end
