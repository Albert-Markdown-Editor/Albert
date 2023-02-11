require "controller_test_helper"

class ProjectsControllerTest < ControllerTestHelper
  test "GET index renders projects page" do
    get projects_path

    assert_response :success
  end

  test "GET index returns all projects" do
    get projects_path

    result = assigns(:projects)

    assert_equal result.pluck(:id).sort, Project.pluck(:id).sort
  end

  test "GET index filters projects" do
    filter_params = { name: projects(:recipes_book).name }

    filtered_projects = Project.filter_by(filter_params)

    get projects_path(**filter_params)

    result = assigns(:projects)

    assert_equal result.pluck(:id).sort, filtered_projects.pluck(:id).sort
  end

  test "GET show renders project" do
    project = projects(:recipes_book)

    get project_path(project)

    assert_response :success
  end

  test "GET show assigns specified project" do
    project = projects(:recipes_book)

    get project_path(project)

    result = assigns(:project)

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

  test "GET show with deprecated project slug as parameter redirects to valid parameter" do
    project = projects(:recipes_book)
    project.save

    assert project.slug.present?
    deprecated_slug = project.slug

    project.update(name: "New #{project.name}")
    assert_not_equal project.slug, deprecated_slug

    get project_path(id: deprecated_slug)

    result = assigns(:project)

    assert_response :redirect
    assert_equal result.id, project.id
  end

  test "GET new renders new project page" do
    get new_project_path

    assert_response :success
  end

  test "POST create creates new project if data is valid" do
    project_payload = { project: FactoryBot.attributes_for(:project) }

    assert Project.new(**project_payload.dig(:project)).valid?

    total_projects = Project.count

    assert_changes -> { Project.count }, from: total_projects, to: total_projects + 1 do
      post projects_path(project_payload)
    end
  end

  test "POST create redirects to created project show page if project is created" do
    project_payload = { project: FactoryBot.attributes_for(:project) }

    assert Project.new(**project_payload.dig(:project)).valid?

    post projects_path(project_payload)

    result = assigns(:project)

    assert_response :redirect
    assert_redirected_to project_path(result)
  end

  test "POST create does not create a new project if data is invalid" do
    project_payload = { project: FactoryBot.attributes_for(:project) }

    project_payload[:project][:name] = nil

    refute Project.new(**project_payload.dig(:project)).valid?

    assert_no_changes -> { Project.count } do
      post projects_path(project_payload)
    end
  end

  test "POST create renders create view if project is not created" do
    project_payload = { project: FactoryBot.attributes_for(:project) }

    project_payload[:project][:name] = nil

    refute Project.new(**project_payload.dig(:project)).valid?

    post projects_path(project_payload)

    assert_template :create
  end

  test "POST create returns unprocessable entity response code if data is invalid" do
    project_payload = { project: FactoryBot.attributes_for(:project) }

    project_payload[:project][:name] = nil

    refute Project.new(**project_payload.dig(:project)).valid?

    post projects_path(project_payload)

    assert_response :unprocessable_entity
  end
end
