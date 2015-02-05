require('spec_helper')

describe(Venue) do

  it("capitalizes the first letter of the name") do
    venue = Venue.create({:venue_name => "roseland"})
    expect(venue.venue_name()).to(eq("Roseland"))
  end

  it("capitalizes the first letter of each letter in the name") do
    venue = Venue.create({:venue_name => "roseland ballroom"})
    expect(venue.venue_name()).to(eq("Roseland Ballroom"))
  end

end
