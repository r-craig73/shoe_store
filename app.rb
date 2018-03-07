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

get('/shoes') do
  @stores = Store.all()
  @shoes = Shoe.all()
  erb(:shoes)
end

post('/shoes') do
  brand = params[:brand]
  price = params[:price]
  store_id = params[:store_id]
  @shoe = Shoe.new({:brand => brand, :price => price, :id => nil})
  @shoes = Shoe.all()
  if @shoe.save()
    erb(:success)
  else
    erb(:shoe_errors)
  end
end

get('/stores/:id') do
  name = params[:name]
  brand = params[:brand]
  @shoes = Shoe.all()
  @store = Store.find(params.fetch('id').to_i())
  #binding.pry
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

get('/shoes/:id') do
  brand = params[:brand]
  price = params[:price]
  @stores = Store.all()
  @shoe = Shoe.find(params.fetch('id').to_i())
  @shoes = Shoe.all()
  #binding.pry
  erb(:shoe_edit)
end

patch('/shoes/:id') do
  brand = params[:brand]
  price = params[:price]
  @shoe = Shoe.find(params.fetch('id').to_i())
  @shoe.update({:brand => brand})
  @shoes = Shoe.all()
  if @shoe.save()
    erb(:success)
  else
    erb(:shoe_errors)
  end
end

delete('/shoes/:id') do
  @shoe = Shoe.find(params.fetch('id').to_i())
  if @shoe.destroy()
    #redirect("/")
    erb(:success)
  else
    erb(:shoe_errors)
  end
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
