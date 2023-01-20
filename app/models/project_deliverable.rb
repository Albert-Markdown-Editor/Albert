# frozen_string_literal: true

class ProjectDeliverable < ApplicationRecord
  # Ensures only deliverables with valid kinds are created
  enum kind: %w[Book BlogPost]

  include ViewBasedModel
end
