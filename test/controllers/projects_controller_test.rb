require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "GET index returns all projects" do
    get projects_url

    result = assigns(:projects)

    assert_response :success
    assert_equal result.pluck(:id).sort, Project.pluck(:id).sort
  end

  test "GET show returns a project" do
    project = projects(:recipes_book)

    get project_path(project)

    result = assigns(:project)

    assert_response :success
    assert_equal result.id, project.id
  end

  test "GET show accepts project slug as ID parameter" do
    project = projects(:recipes_book)
    project.save

    get project_path(id: project.slug)

    result = assigns(:project)

    assert_response :success
    assert_equal result.id, project.id
  end
end