require('spec_helper')

describe(Venue) do
  it{should have_and_belong_to_many(:bands)}

  it("validates presence of name") do
    venue = Venue.new({:venue_name => ""})
    expect(venue.save()).to(eq(false))
  end

  it("capitalizes the first letter of the name") do
    venue = Venue.create({:venue_name => "roseland"})
    expect(venue.venue_name()).to(eq("Roseland"))
  end

  it("capitalizes the first letter of each letter in the name") do
    venue = Venue.create({:venue_name => "roseland ballroom"})
    expect(venue.venue_name()).to(eq("Roseland Ballroom"))
  end

end
