# frozen_string_literal: true

# Projects are a composition of project_documents. They provide additional project_documents
# to plan and coordinate the ellaboration of existing and new project_documents between
# multiple users
class Project < ApplicationRecord
  extend FilterableModel
  include WithFriendlyId

  class << self
    def filter_proxy = Filters::ProjectFilterProxy
  end

  # Associations
  has_many :documents, dependent: :delete_all
  has_many :blog_posts, dependent: :nullify
  has_many :books, dependent: :nullify

  # Validations
  validates :name, presence: true

  # Friendly URL Slug Configuration
  configure_slug(:name, with_history: true)

  def should_generate_new_friendly_id?
    name_changed? || super
  end
end
