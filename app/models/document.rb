# frozen_string_literal: true

class Document < ApplicationRecord
  extend Filterable
  include WithFriendlyId

  # Associations
  belongs_to :project, optional: true
  has_many :document_fragments, dependent: :delete_all

  # Enums
  enum :status, { idea: 0, draft: 10, waiting_for_review: 20, waiting_for_publication: 30, published: 40 }

  # Validations
  validates :name, presence: true
  validates :status, presence: true

  # Friendly URL Slug Configuration
  configure_slug(:name)

  def should_generate_new_friendly_id?
    name_changed? || super
  end
end
