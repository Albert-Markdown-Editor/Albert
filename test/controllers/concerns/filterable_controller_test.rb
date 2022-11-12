require "controller_test_helper"

class FilterableControllerTest < ControllerTestHelper
  class FilterableController < ApplicationController
    include ::FilterableController

    INDEX_ROUTE = "/filtered_documents"
    INDEX_ROUTE_ACTION = "filterable_controller_test/filterable#index"

    def index
      render json: filter(Document)
    end

    def filter_params
      {  name: params["name"]  }
    end
  end

  class InvalidFilterableController < ApplicationController
    include ::FilterableController

    INDEX_ROUTE = "/non_filtered_documents"
    INDEX_ROUTE_ACTION = "filterable_controller_test/invalid_filterable#index"

    def index
      render json: filter(Document)
    end
  end

  test "Filterable controller requires .filter_params method to be defined in order to filter" do
    filters = { name: "Test Document #{Time.now}" }

    assert_raises do
      draw_route_and_request(
        InvalidFilterableController::INDEX_ROUTE,
        InvalidFilterableController::INDEX_ROUTE_ACTION,
        :get,
        filters
      )
    end
  end

  test ".filter filters results by specified filter parameters" do
    filters = { name: "Test Document #{Time.now}" }

    documents = FactoryBot.create_list(:document, 3, **filters)

    results = draw_route_and_request(
      FilterableController::INDEX_ROUTE,
      FilterableController::INDEX_ROUTE_ACTION,
      :get,
      filters
    )

    assert_equal results.map { |r| r.fetch("id") }.sort, documents.pluck(:id).sort
  end
end
