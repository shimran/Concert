require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  @bands = Band.all()
  erb(:index)
end

post('/bands') do
  band_name = params.fetch("band_name")
  @band = Band.create({:band_name => band_name})
  @bands = Band.all()
  erb(:index)
end

get('/bands/:id') do
  @band = Band.find(params['id'].to_i())
  #Get 'id' is already in Active Record database for band
  @venues = @band.venues()
  #ActiveRecord already knows the relationship, @band.venues() asks for
  #all venues with the same band iD.
  erb(:band)
end

post('/bands/:id') do
  venue_name = params.fetch("venue_name")
  band_id = params.fetch("band_id")
  @venue = Venue.create({:venue_name => venue_name, :band_id => band_id})
  @band = Band.find(params['id'].to_i())
  @venues = @band.venues()
  erb(:band)
end

patch('/bands/:id') do
  @band = Band.find(params['id'].to_i())
  band_id = params.fetch("band_id")
  #Same view, so we dont ned to fetch from database, just from the views page.
  band_name = params.fetch("band_name")
  @band.update({ :band_name => band_name })
  @venues = @band.venues()
  erb(:band)
end

delete('/bands/:id') do
  @band = Band.find(params['id'].to_i())
  @band.delete()
  @band.venues.delete()
  #You must delete venues associated survey_id, otherwise they just sit in database
  #without an id. Just deleting survey_id does not automatically clear venues in DB.
  @bands = Band.all()
  erb(:index)
end

get('/venues/:id') do
  @venue = Venue.find(params['id'].to_i())
  erb(:venue)
end

patch('/venues/:id') do
  @venue = Venue.find(params['id'].to_i())
  venue_name = params.fetch("venue_name")
  @venue.update({:venue_name => venue_name})
  erb(:venue)
end

delete('/venues/:id') do
  @venue = Venue.find(params['id'].to_i())
  band_id = @venue.band_id()
  @venue.delete()
  redirect "/bands/#{band_id}"
#String interpolation needed for the redirect, need double quotes ""
end
