# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :project, optional: true

  validates :title, presence: true
end
