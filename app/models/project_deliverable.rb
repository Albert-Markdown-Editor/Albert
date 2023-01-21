# frozen_string_literal: true

class ProjectDeliverable < ApplicationRecord
  class << self
    def compatible_kinds = %w[Book BlogPost]
  end

  include ViewBasedModel
end
