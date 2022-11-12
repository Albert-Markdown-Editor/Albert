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
