require "test_helper"

class ProjectDocumentsControllerTest < ActionDispatch::IntegrationTest
  test "GET index returns all project_documents" do
    project = projects(:recipes_book)

    get project_documents_path(project)

    result = assigns(:documents)

    assert_response :success
    assert_equal result.pluck(:id).sort, project.documents.pluck(:id).sort
  end

  test "GET index accepts project slug as ID parameter" do
    project = projects(:recipes_book)
    project.save

    get project_documents_path(project_id: project.slug)

    result = assigns(:documents)

    assert_response :success
    assert_equal result.pluck(:id).sort, project.documents.pluck(:id).sort
  end

  test "GET show returns a document" do
    project = projects(:recipes_book)
    document = documents(:cooking_pasta_post)

    get project_document_path(project, document)

    result = assigns(:document)

    assert_response :success
    assert_equal result.id, document.id
  end

  test "GET show accepts document slug as ID parameter" do
    project = projects(:recipes_book)
    project.save
    document = documents(:cooking_pasta_post)
    document.save

    get project_document_path(project_id: project.slug, id: document.slug)

    result = assigns(:document)

    assert_response :success
    assert_equal result.id, document.id
  end
end
