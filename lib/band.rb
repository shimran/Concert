class Band <ActiveRecord::Base

  has_and_belongs_to_many(:venues)

  before_save(:capitalize_name)
  scope(:alphabetical, -> { order(:band_name) })

  private
  define_method(:capitalize_name) do
    capitalize_name = self.band_name().split(" ")
    capitalized_capitalize_name = []
    capitalize_name.each() do |word|
      capitalized_capitalize_name.push(word.capitalize())
    end
    self.band_name=capitalized_capitalize_name.join(" ")
  end

end
