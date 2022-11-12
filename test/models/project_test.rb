require "model_test_helper"

class ProjectTest < ModelTestHelper
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
