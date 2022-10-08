class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects, id: :uuid do |t|
      t.string :name, null: false
      t.string :description

      t.timestamps
    end

    add_index :projects, :id
    add_index :projects, :name
  end
end
