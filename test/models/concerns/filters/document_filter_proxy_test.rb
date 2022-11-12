require "test_helper"

class DocumentFilterProxyTest < ActiveSupport::TestCase
  test ".name filters documents by name" do
    filters = { name: "Test Document #{Time.now}" }

    documents = FactoryBot.create_list(:document, 3, **filters)

    results = ::Filters::DocumentFilterProxy.filter_by(filters)

    assert_equal documents.pluck(:id).sort, results.pluck(:id).sort
  end

  test ".status filters documents by status" do
    filters = { status: Document.statuses.keys.sample }

    documents = FactoryBot.create_list(:document, 3, **filters)

    results = ::Filters::DocumentFilterProxy.filter_by(filters)

    assert_equal documents.pluck(:id).sort, results.pluck(:id).sort
  end
end
