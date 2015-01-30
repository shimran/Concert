class Band < ActiveRecord::Base
has_many(:bands)
before_save(:normalize_title)
private
define_method(:normalize_title) do
self.title = (title().capitalize())
end
end