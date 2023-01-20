class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books, id: :uuid do |t|
      t.string :title
      t.string :summary
      t.date :release_date
      t.references :project, null: true, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
