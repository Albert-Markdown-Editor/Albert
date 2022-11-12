require "test_helper"

class ProjectFilterProxyTest < ActiveSupport::TestCase
  test ".name filters documents by name" do
    filters = { name: "Test Project #{Time.now}" }

    documents = FactoryBot.create_list(:project, 3, **filters)

    results = ::Filters::ProjectFilterProxy.filter_by(filters)

    assert_equal documents.pluck(:id).sort, results.pluck(:id).sort
  end

  test ".description filters documents by status" do
    filters = { description: "Test project description #{Time.now}" }

    documents = FactoryBot.create_list(:project, 3, **filters)

    results = ::Filters::ProjectFilterProxy.filter_by(filters)

    assert_equal documents.pluck(:id).sort, results.pluck(:id).sort
  end
end
