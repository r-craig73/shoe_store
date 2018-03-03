ENV['RACK_ENV'] = 'test'

require('volunteer')
require('project')
require('rspec')
require('pry')
require('pg')
require('sinatra/activerecord')
