class Venue <ActiveRecod::Base
has_many(:venue)
before_save(:normalize_title)
private
define_method(:normalize_title) do
self.title = (title().capitalize())
end
end