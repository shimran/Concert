class Venue <ActiveRecord::Base

  has_and_belongs_to_many(:bands)
  validates(:venue_name, { :presence => true })
  before_save(:capitalize_name)
  scope(:alphabetical, -> { order(:venue_name) })

  private
  define_method(:capitalize_name) do
    capitalize_name = self.venue_name().split(" ")
    capitalized_capitalize_name = []
    capitalize_name.each() do |word|
      capitalized_capitalize_name.push(word.capitalize())
    end
    self.venue_name=capitalized_capitalize_name.join(" ")
  end

end
