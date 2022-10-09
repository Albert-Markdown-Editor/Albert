# frozen_string_literal: true

# Concern used by all +models+ which make use of url slugs (+/projects/my-project+ instead of +/projects/2+).
# - Models including this concern require a +slug+ column in the database in order to store their respective
#   url slugs.
# - Models including this concern with +to_param+ method will return now the +slug+ instead of the +id+.
#   This is important to know when working with +route-helpers+.
module WithFriendlyId
  extend ActiveSupport::Concern

  included do
    include FriendlyId

    def should_generate_new_friendly_id?
      raise "
        Model class #{self.class.name} does not define method 'should_generate_new_friendly_id?',
        required by 'WithFriendlyId' concern. Define method returning true when any of the attributes
        associated to the model slug generation changes in order to trigger slug update in model.
      "
    end
  end

  class_methods do
    def configure_slug(attribute, with_history: false, with_scope: nil)
      friendly_id(attribute, use: [:slugged, (:history if with_history)].compact)
    end
  end
end
