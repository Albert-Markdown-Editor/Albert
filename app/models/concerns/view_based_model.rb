# frozen_string_literal: true

# Concern used by all +models+ whose inner database representation consists on a +database view+.
# If you create a +Model+ class based on a database view make sure to include this concern in it.
module ViewBasedModel
  extend ActiveSupport::Concern

  # View Models are made out of database views, so they are read only
  def readonly? = true
end
