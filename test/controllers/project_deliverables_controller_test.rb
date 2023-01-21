require "controller_test_helper"

class ProjectDeliverablesControllerTest < ControllerTestHelper
  def setup
    @project = projects(:recipes_book)

    @deliverables = @project.deliverables

    assert_not @deliverables.blank?
  end

  test "GET index renders projects page" do
    get project_deliverables_path(@project)

    assert_response :success
  end

  test "GET index returns all project deliverables" do
    get project_deliverables_path(@project)

    result = assigns(:deliverables)

    assert_equal result.pluck(:id).sort, @project.deliverables.pluck(:id).sort
  end

  test "GET index filters deliverables" do
    filter_params = { title: @deliverables.first.title }

    filtered_deliverables = @project.deliverables.filter_by(filter_params)

    get project_deliverables_path(@project, **filter_params)

    result = assigns(:deliverables)

    assert_equal result.pluck(:id).sort, filtered_deliverables.pluck(:id).sort
  end
end
