# frozen_string_literal: true

# Concern used by all +models+ whose inner database representation consists on a database +view+.
# If you create a +Model+ class based on a database view make sure to include this concern in it.
module ViewBasedModel
  extend ActiveSupport::Concern

  class_methods do
    def compatible_kinds
      raise "
        Model #{name} does not define `compatible_kinds` class method.
        Define method returning an array of strings corresponding to the model
        class names of the tables the view record is composed of. Check example
        in Project and ProjectDeliverable classes.
      "
    end
  end

  # View Models are made out of database views, they are read only
  def readonly? = true

  included do
    enum kind: compatible_kinds.index_with(&:to_s)
  end
end
