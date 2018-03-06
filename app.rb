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

post('/success') do
  name = params[:name]
  @store = Store.new({:name => name, :id => nil})
  @stores = Store.all()
  if  @store.save()
    erb(:success)
  else
    erb(:errors)
  end
end

get('/shoes') do
  @shoes = Shoe.all()
  erb(:shoes)
end

get('/stores/:id') do
  name = params[:name]
  @store = Store.find(params.fetch('id').to_i())
  erb(:store_edit)
end

patch('/stores/:id') do
  name = params[:name]
  @store = Store.find(params.fetch('id').to_i())
  @store.update({:name => name})
  @stores = Store.all()
  if @store.save()
    erb(:success)
  else
    erb(:errors)
  end
end

delete('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  if @store.destroy()
    redirect("/")
  else
    erb(:store_edit)
  end
end
