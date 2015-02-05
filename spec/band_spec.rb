require('spec_helper')


describe(Band) do

  it("capitalizes the first letter of band name") do
    band = Band.create({:band_name => "strokes"})
    expect(band.band_name()).to(eq("Strokes"))
  end

  it("capitalizes the first letter of each word in the band name") do
    band = Band.create({:band_name => "toro y moi"})
    expect(band.band_name()).to(eq("Toro Y Moi"))
  end
end
