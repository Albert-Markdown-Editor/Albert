require "test_helper"

class DocumentTest < ActiveSupport::TestCase
  # Model Slug Configuration
  # ------------------------
  test "A document uses its name as slug" do
    model_with_friendly_id_sets_proper_slug? FactoryBot.create(:document), :name
  end

  test "If a document changes its name, its slug is updated according to the new name" do
    model = FactoryBot.create(:document)
    new_name = "New #{model.name}"
    new_slug = new_name.parameterize
    update_changes_slug = { name: new_name }
    update_not_changes_slug = { description: "Again: #{model.description}" }

    model_with_friendly_id_updates_slug_when_required? model, new_slug, update_changes_slug, update_not_changes_slug
  end
  
  # Model Validations
  # -----------------
  test "A document requires a name" do
    result = FactoryBot.build(:document)
    assert result.valid?

    result.name = nil
    assert_not result.valid?
    assert result.errors.key?(:name)
  end

  test "A document requires a status" do
    result = FactoryBot.build(:document)
    assert result.valid?

    result.status = nil
    assert_not result.valid?
    assert result.errors.key?(:status)
  end

  test "Document has 'idea' as default status" do
    result = Document.new
    assert result.idea?
  end
end
