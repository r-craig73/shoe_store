ENV['RACK_ENV'] = 'test'

require('rspec')
require('pry')
require('pg')
require('sinatra/activerecord')
require('shoe')
require('store')
require('shoulda-matchers')
require('money')

RSpec.configure do |config|
  config.after(:each) do
    Shoe.all().each() do |shoe|
      shoe.destroy()
    end
    Store.all().each() do |store|
      store.destroy()
    end
  end
end
