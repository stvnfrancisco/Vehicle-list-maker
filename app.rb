require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/vehicle')

get('/') do
  # @vehicle = Vehicle.all()
  erb(:index)
end

get('/vehicles') do
  @vehicles = Vehicle.all()
  erb(:vehicles)
end

get('/vehicles/new') do
  erb(:vehicles_form)
end

post('/vehicles') do
  make = params.fetch('make')
  model = params.fetch('model')
  year = params.fetch('year')
  vehicle = Vehicle.new(make, model, year)
  vehicle.save()
  erb(:success)
end


get('/vehicles/:id') do
  @vehicles = Vehicle.find(params.fetch('id'))
  erb(:vehicles)
end
