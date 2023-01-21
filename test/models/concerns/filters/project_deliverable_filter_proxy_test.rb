require "test_helper"

class ProjectDeliverableFilterProxyTest < ActiveSupport::TestCase
  def setup
    @project = projects(:recipes_book)

    @project_deliverables = @project.deliverables

    assert_not @project_deliverables.blank?
  end

  test ".title filters documents by title" do
    filters = { title: @project_deliverables.first.title }

    deliverables = @project_deliverables.select do |d|
      d.title.match?(/#{filters[:title]}/i)
    end

    results = ::Filters::ProjectDeliverableFilterProxy.filter_by(filters)

    assert_equal deliverables.pluck(:id).sort, results.pluck(:id).sort
  end

  test ".summary filters documents by summary" do
    filters = { summary: @project_deliverables.first.summary }

    deliverables = @project_deliverables.select do |d|
      d.summary.match?(/#{filters[:summary]}/i)
    end

    results = ::Filters::ProjectDeliverableFilterProxy.filter_by(filters)

    assert_equal deliverables.pluck(:id).sort, results.pluck(:id).sort
  end
end
