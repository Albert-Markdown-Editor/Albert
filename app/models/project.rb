# frozen_string_literal: true

# Projects are a composition of project_documents. They provide additional project_documents
# to plan and coordinate the ellaboration of existing and new project_documents between
# multiple users
class Project < ApplicationRecord
  extend FilterableModel
  include WithFriendlyId, MultistepFormModel

  class << self
    def filter_proxy = Filters::ProjectFilterProxy
  end

  # Associations
  has_many :deliverables, class_name: "ProjectDeliverable"
  has_many :documents, dependent: :delete_all
  has_many :blog_posts, dependent: :nullify
  has_many :books, dependent: :nullify

  accepts_nested_attributes_for :books
  accepts_nested_attributes_for :blog_posts

  # Validations
  validates :name, presence: true

  validates_associated :books

  # Friendly URL Slug Configuration
  configure_slug(:name, with_history: true)

  def should_generate_new_friendly_id?
    name_changed? || super
  end
end
