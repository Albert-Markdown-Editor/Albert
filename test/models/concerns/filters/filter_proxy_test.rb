require "test_helper"

class FilterProxyTest < ActiveSupport::TestCase
  class InvalidFilterProxy < "Filters::FilterProxy".constantize
  end

  def setup
    @proxy ||= "Filters::DocumentFilterProxy".constantize
    @proxy_model_class = Document
    @proxy_scopes_module = "Filters::DocumentFilterScopes".constantize
    @proxy_scope = @proxy_model_class.extending(@proxy_scopes_module)
  end

  test "#query_scope returns model class associated to proxy if exists" do
    assert_equal @proxy.query_scope, @proxy_model_class
  end

  test "#query_scope raises error if there is no model class associated to proxy" do
    assert_raises { InvalidFilterProxy.query_scope }
  end

  test "#query_filter_scopes_module returns scopes module associated to proxy if exists" do
    assert_equal @proxy.query_filter_scopes_module, @proxy_scopes_module
  end

  test "#query_filter_scopes_module raises error if there is no scopes module associated to proxy" do
    assert_raises { InvalidFilterProxy.query_filter_scopes_module }
  end

  test "#filter_by combines all filter scopes into a single query" do
    result = @proxy.filter_by({ name: "a name", status: :idea })
    assert result.to_sql.include?(@proxy_scope.name("a name").to_sql.split("WHERE")[1])
    assert result.to_sql.include?(@proxy_scope.status(:idea).to_sql.split("WHERE")[1])
  end

  test "#filter_by ignores scopes with empty/blank values" do
    result = @proxy.filter_by({ name: "", status: :idea })
    assert_not result.to_sql.include?("name")
    assert result.to_sql.include?(@proxy_scope.status(:idea).to_sql.split("WHERE")[1])
  end

  test "#filter_by ignores undefined scopes" do
    result = @proxy.filter_by({ invalid_attribute: "invalid value", status: :idea })
    assert result.to_sql.include?(@proxy_scope.status(:idea).to_sql.split("WHERE")[1])
  end
end
