# frozen_string_literal: true

class ProjectDeliverable < ApplicationRecord
  include ViewBasedModel

  # Ensures only deliverables with valid kinds are created
  enum kind: %w[Book BlogPost]
end
