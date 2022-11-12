require "test_helper"

class ControllerTestHelper < ActionDispatch::IntegrationTest
  private

  # Access to application routes to allow drawing new routes, and ensures
  # after executing yielded block original routes are reloaded and new ones
  # discarded
  def with_routes
    yield @routes
  ensure
    Rails.application.routes_reloader.reload!
  end

  def draw_route_and_request(path, action, method, params)
    with_routes do |routes|
      routes.draw do
        get path, to: action
      end

      send(method, path, params:)
    end

    JSON.parse(response.body) rescue nil
  end
end
