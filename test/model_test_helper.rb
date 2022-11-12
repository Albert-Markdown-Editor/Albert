require "test_helper"

class ModelTestHelper < ActiveSupport::TestCase
  def model_with_friendly_id_sets_proper_slug?(model, slug_attribute)
    model.save
    assert_equal model.slug, model[slug_attribute].parameterize
  end

  def model_with_friendly_id_updates_slug_when_required?(model, new_slug, update_changes_slug, update_not_changes_slug)
    model.save

    assert_not_equal model.slug, new_slug

    model.update(update_not_changes_slug)

    assert_not_equal model.slug, new_slug

    model.update(update_changes_slug)

    assert_equal model.slug, new_slug
  end

  def model_with_friendly_id_history_registers_old_slug_when_it_changes?(model, new_slug, update_changes_slug)
    model.save

    assert_not_equal model.slug, new_slug

    assert_difference -> { FriendlyIdSlug.count }, 1 do
      model.update(update_changes_slug)
      assert_equal model.slug, new_slug
    end
  end
end
