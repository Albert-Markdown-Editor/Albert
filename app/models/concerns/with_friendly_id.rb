# frozen_string_literal: true

# Concern used by all +models+ which make use of url slugs (+/projects/my-project+ instead of +/projects/2+).
# - Models including this concern require a +slug+ column in the database in order to store their respective
#   url slugs.
# - Models including this concern with +to_param+ method will return now the +slug+ instead of the +id+.
#   This is important to know when working with +route-helpers+.
module WithFriendlyId
  extend ActiveSupport::Concern
  include FriendlyId

  included do
    friendly_id :name, use: [:slugged, :history]
  end
end
