class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)
  before_save(:normalize_band_name)
  private
  define_method(:normalize_band_name) do
    self.band_name = (band_name().capitalize())
  end
end
