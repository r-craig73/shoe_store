require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/store')
require('./lib/shoe')
require('pg')
require('pry')
require('money')

get('/') do
  @stores = Store.all()
  @shoes = Shoe.all()
  erb(:index)
end

post('/success') do
  name = params[:name]
  @store = Store.new({:name => name, :id => nil})
  @stores = Store.all()
  if @store.save()
    erb(:success)
  else
    erb(:store_errors)
  end
end

get('/shoes') do
  @stores = Store.all()
  @shoes = Shoe.all()
  erb(:shoes)
end

post('/shoes') do
  brand = params[:brand]
  price = params[:price]
  @shoe = Shoe.new({:brand => brand, :price => price, :id => nil})
  @shoes = Shoe.all()
  binding.pry
  if @shoe.save()
    erb(:success)
  else
    erb(:shoe_errors)
  end
end

get('/stores/:id') do
  name = params[:name]
  brand = params[:brand]
  price = params[:price]
  @store = Store.find(params.fetch('id').to_i())
  @shoes = Shoe.all()
  @store.shoes()
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
    erb(:store_errors)
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
