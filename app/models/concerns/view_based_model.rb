# frozen_string_literal: true

# Concern used by all +models+ whose inner database representation consists on a +database view+.
# If you create a +Model+ class based on a database view make sure to include this concern in it.
# Always include this model after defining the +kinds+ enum before (see +Product+ class).
module ViewBasedModel
  extend ActiveSupport::Concern

  # View Models are made out of database views, so they are read only
  def readonly? = true

  # View based Model classes should list the set of possible Model class
  # kinds they can embody in an enum. This block ensures all classes including
  # this concern define a +kinds+ method in it
  included do
    raise "View based model requires Kind attribute to exist" unless self.respond_to?(:kinds)
  end
end
