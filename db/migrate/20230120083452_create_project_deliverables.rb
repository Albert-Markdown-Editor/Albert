class CreateProjectDeliverables < ActiveRecord::Migration[7.0]
  def change
    create_view :project_deliverables
  end
end
