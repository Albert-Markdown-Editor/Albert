# frozen_string_literal: true

class Project < ApplicationRecord
  extend FriendlyId

  # Associations
  has_many :documents, dependent: :delete_all

  # Validations
  validates :name, presence: true

  # URL Slugs
  friendly_id :name, use: :slugged
end
