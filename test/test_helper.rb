ENV["RAILS_ENV"] ||= "test"

# Default Rails Helpers
# ---------------------
require_relative "../config/environment"
require "rails/test_help"

# Gem Test Helpers
# ================
#

# Monkeypatches default +ActiveSupport::TestCase+ with additional
# configuration  and helper methods you can use in your tests
class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # HELPERS
  # =======
  # Friendly Slug Helpers
  # ---------------------
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

class ActionDispatch::IntegrationTest
  # Inspired on https://github.com/rails/rails-controller-testing
  # Allows to check controller assignments during a request
  def assigns(key = nil)
    assigns = {}.with_indifferent_access
    @controller.view_assigns.each { |k, v| assigns.regular_writer(k, v) }
    key.nil? ? assigns : assigns[key]
  end
end
