# frozen_string_literal: true

# Projects are a composition of project_documents. They provide additional project_documents
# to plan and coordinate the ellaboration of existing and new project_documents between
# multiple users
class Project < ApplicationRecord
  include WithFriendlyId

  # Associations
  has_many :documents, dependent: :delete_all

  # Validations
  validates :name, presence: true

  # Friendly URL Slug Configuration
  configure_slug(:name, with_history: true)

  def should_generate_new_friendly_id?
    name_changed? || super
  end
end
