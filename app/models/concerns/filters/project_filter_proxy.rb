# frozen_string_literal: true

module Filters
  module ProjectFilterScopes
    extend FilterScopeable

    filter_scope :name, ->(name) { where("name ILIKE ?", "%#{name}%") }
    filter_scope :description, ->(description) { where("description ILIKE ?", "%#{description}%") }
  end

  class ProjectFilterProxy < FilterProxy
    class << self
      def query_scope = Project
      def filter_scopes_module = ProjectFilterScopes
    end
  end
end
