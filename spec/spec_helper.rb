ENV['RACK_ENV'] = 'test'

require('rspec')
require('pry')
require('pg')
require('sinatra/activerecord')
require('shoe')
require('store')

RSpec.configure do |config|
  config.after(:each) do
    Shoe.all().each() do |task|
      task.destroy()
    end
    Store.all().each() do |task|
      task.destroy()
    end
  end
end
