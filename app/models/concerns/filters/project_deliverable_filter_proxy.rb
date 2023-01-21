# frozen_string_literal: true

module Filters
  module ProjectDeliverableFilterScopes
    extend FilterScopeable

    filter_scope :title, ->(title) { where("title ILIKE ?", "%#{title}%") }
    filter_scope :summary, ->(summary) { where("summary ILIKE ?", "%#{summary}%") }
  end

  class ProjectDeliverableFilterProxy < FilterProxy
    class << self
      def query_scope = ProjectDeliverable
      def filter_scopes_module = ProjectDeliverableFilterScopes
    end
  end
end
