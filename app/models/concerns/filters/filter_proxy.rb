# frozen_string_literal: true

module Filters
  class FilterProxy
    class << self
      # Model class associated to query to proxy. Used as base to build our filter query
      def query_scope
        raise "Class #{name} does not define query_scope class method."
      end

      def filter_scopes_module
        raise "Class #{name} does not define filter_scopes_module class method."
      end

      def filter_by(filters = {})
        extended_scope = query_scope.extending(filter_scopes_module)

        filters.each do |filter_scope, filter_value|
          if filter_value.present? && extended_scope.respond_to?(filter_scope)
            extended_scope = extended_scope.send(filter_scope, filter_value)
          end
        end

        extended_scope
      end
    end
  end
end
