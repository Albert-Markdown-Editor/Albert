require "model_test_helper"

class ProjectTest < ModelTestHelper
  def setup
    @sample_project = projects(:recipes_book)
  end

  test ".deliverables return all project deliverables" do
    project_kinds = ProjectDeliverable.kinds.keys.map(&:underscore).map(&:pluralize)
    project_deliverables = project_kinds.map { |k| @sample_project.send(k) }.flatten.map { |d| d.id }.sort

    result = @sample_project.deliverables.pluck(:id).sort

    assert_equal project_deliverables, result
  end

  # Fixtures
  # --------
  test "Project fixtures are valid" do
    assert projects.all?(&:valid?)
  end

  # Model Slug Configuration
  # ------------------------
  test "A project uses its name as slug" do
    model_with_friendly_id_sets_proper_slug? FactoryBot.create(:project), :name
  end

  test "If a project changes its name, its slug is updated according to the new name" do
    model = FactoryBot.create(:project)
    new_name = "New #{model.name}"
    new_slug = new_name.parameterize
    update_changes_slug = { name: new_name }
    update_not_changes_slug = { description: "Again: #{model.description}" }

    model_with_friendly_id_updates_slug_when_required? model, new_slug, update_changes_slug, update_not_changes_slug
  end

  test "If a project changes its slug, it is register in the slug registry" do
    model = FactoryBot.create(:project)
    new_name = "New #{model.name}"
    new_slug = new_name.parameterize
    update_changes_slug = { name: new_name }

    model_with_friendly_id_history_registers_old_slug_when_it_changes? model, new_slug, update_changes_slug
  end

  # Model Validations
  # -----------------
  test "A project requires a name" do
    result = FactoryBot.build(:project)
    assert result.valid?

    result.name = nil
    assert_not result.valid?
    assert result.errors.key?(:name)
  end

  private

  def expected_slug(item)
    item.name.parameterize
  end
end
