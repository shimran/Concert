class Venue <ActiveRecord::Base
  has_and_belongs_to_many(:venue)
  before_save(:normalize_venue_name)

private
  define_method(:normalize_venue_name) do
    self.venue_name = (venue_name().capitalize())
  end
end
