require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

post('/bands') do
  @bands = Band.all()
  name = params.fetch('name')
  @band = Band.new({:band_name => name})
  @band.save()
  redirect '/'
end

post('/venues') do
  @venues = Venue.all()
  name = params.fetch('name')
  @venue = Venue.new({:venue_name => name})
  @venue.save()
  redirect '/'
end

get('/bands/:id') do
  id = params.fetch("id").to_i()
  @band = Band.find(id)
  @venues = Venue.all()
  erb(:band)
end

patch('/bands_venues_add') do
  id = params.fetch("id")
  @band = Band.find(id)
  venue_ids_array = params.fetch("venue_ids_array") + @band.venue_ids
  @band.update({:venue_ids => venue_ids_array})
  redirect back
end

patch('/bands/:id') do
  name = params.fetch("band_name")
  id = params.fetch("id").to_i()
  @band = Band.find(id)
  @band.update({:band_name => name})
  redirect back
end

delete('/bands/:id') do
  id = params.fetch("id").to_i()
  @band = Band.find(id)
  @band.destroy()
  redirect '/'
end

get('/venues/:id') do
  id = params.fetch("id").to_i()
  @venue = Venue.find(id)
  @bands = Band.all()
  erb(:venue)
end

patch('/venues_bands_add') do
  id = params.fetch("id")
  @venue = Venue.find(id)
  band_ids_array = params.fetch("band_ids_array") + @venue.band_ids
  @venue.update({:band_ids => band_ids_array})
  redirect back
end

patch('/venues/:id') do
  name = params.fetch("venue_name")
  id = params.fetch("id").to_i()
  @venue = Venue.find(id)
  @venue.update({:venue_name => name})
  redirect back
end

delete('/venues/:id') do
  id = params.fetch("id").to_i()
  @venue = Venue.find(id)
  @venue.destroy()
  redirect '/'
end
