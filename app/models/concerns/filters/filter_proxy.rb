# frozen_string_literal: true

module Filters
  class FilterProxy
    extend FilterScopeable

    # Filter proxy conventions:
    # - All filter proxy objects must be placed under "filters" namespace.
    # - All filter proxy classes must be sufixed with "FilterProxy".
    # - All filter proxy scopes module must be sufixed with "FilterScopes".
    FILTER_PROXY_SUFIX = name.demodulize.freeze
    FILTER_PROXY_NAMESPACE = "Filters"
    FILTER_PROXY_SCOPE_SUFIX = "FilterScopes"

    class << self
      def query_scope_class_name
        name.sub(FILTER_PROXY_SUFIX, "").sub("#{FILTER_PROXY_NAMESPACE}::", "")
      end

      # Model class associated to query to proxy. Used as base to build our filter query
      def query_scope
        return @scope_class if @scope_class.present?

        @scope_class = query_scope_class_name.constantize
      rescue NameError
        raise "
          #{name} proxy class expects #{query_scope_class_name} model class to be defined.
          Please make sure either model class #{query_scope_class_name} is defined or that
          your filter proxy class #{name} matches with the respective model class name
        "
      end

      def query_filter_scopes_module_name
        "#{FILTER_PROXY_NAMESPACE}::#{query_scope_class_name}#{FILTER_PROXY_SCOPE_SUFIX}"
      end

      def query_filter_scopes_module
        return @scopes_module if @scopes_module.present?

        @scopes_module = query_filter_scopes_module_name.constantize
      rescue NameError
        raise "
          #{name} proxy class expects #{query_filter_scopes_module_name} module to be defined.
          Please make sure either module #{query_filter_scopes_module_name} is defined under filters
          namespace or that your filter proxy class #{name} matches with the respective module class name
        "
      end

      def filter_by(filters = {})
        extended_scope = query_scope.extending(query_filter_scopes_module)

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
