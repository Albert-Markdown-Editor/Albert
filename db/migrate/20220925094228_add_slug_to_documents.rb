class AddSlugToDocuments < ActiveRecord::Migration[7.0]
  def change
    add_column :documents, :slug, :string
  end
end
