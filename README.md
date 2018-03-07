# shoe_store

#### by Ron Craig (ron.craig@comcast.net)
#### started 03/02/2018, last update 03/06/2018 (MM/DD/YYYY)

### GitHub repository: https://github.com/r-craig73/shoe_store

## Description
### An app using Active Reader, ruby, rubygems, BDD, Sinatra and CRUD routing to create a shoe store site organizing shoe stores and shoe brands.

## Specifications
### Back end specs: class Store
1. Join relationship with Shoe (using shoulda-matchers gem).
2. Capitalize (using the titleize method and titleize_name callback) the first letter of the store name.
3. Validate the presence of a store name (store name is not saved if a user enters a blank store name).
4. Validate the length of the store name does not exceed 100 characters.
5. Validate the store name is unique.

### Back end specs: class Shoe
1. Join relationship with Store (using shoulda-matchers gem).
2. Capitalize (using the titleize method and titleize_name callback) the first letter of the shoe brand.
3. Validate the presence of a shoe brand (shoe brand name is not saved if a user enters a blank shoe brand name).
4. Validate the presence of a shoe brand's price (price is not saved if a user enters no cost).
5. Validate the length of the shoe brand does not exceed 100 characters.
6. Validate the shoe brand is unique.
7. Correct currency format (25 -> $25.00). (ONGOING: Could be psql related or callback function?)

### Front end specs: Sinatra and user stories
1. A user should be able to add, update, delete and list shoe stores.
2. A user should be able to add and list new shoe brands and price.
3. Information is not saved if you enter a blank store, shoe brand, or price.
4. A user should be able to add shoe brands in the application.
5. A user should be able to associate the same brand of shoes with multiple stores.(ONGOING)
6. A user should be able to input a shoe brand to a store to show where they are sold. (ONGOING)



## Setup/Instructions
### Install Sinatra Active Reader
* ($ gem install sinatra-activerecord)
### Install rake
* ($ gem install rake)
### Create and edit (1) Gemfile and (2) Rakefile in the project's root directory
### Install rubygems (Rspec, pry, Capybara and Sinatra).  In the project's root directory...
* Install gem bundler ($ gem install bundler; $ bundle install; $ bundle update)
### Install Postgres.  Open another terminal window, go to home directory ($ cd ~)...
* Install Postgres ($ gem install pg)
* Open Postgres ($ psql)

## Known Bugs
### No currency value for shoe brands.

## Technology used
* Ruby, Sinatra and shoulda-matchers (application)
* Active Record and Rake (database and application)
* Rspec and Capybara (testing)

### MIT License

Copyright (c) 2018 **_Ron Craig (ron.craig@comcast.net)_**
