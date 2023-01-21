# frozen_string_literal: true

class BlogPost < ApplicationRecord
  belongs_to :project, optional: true
end
