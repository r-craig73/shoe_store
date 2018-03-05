require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/store')
require('./lib/shoe')
require('pg')
require('pry')


get('/') do
  @stores = Store.all()
  @shoes = Shoe.all()
  erb(:index)
end

get('/stores') do
  @stores = Store.all()
  erb(:stores)
end

post("/store/edit") do
  name = params[:name]
  @store = Store.new({:name => name, :done => false})
  if @store.save()
    erb(:success)
  else
    erb(:store_errors)
  end
end
