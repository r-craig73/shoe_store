
require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the store and update creation path', {:type => :feature} do
  it 'create a store name and update the store name' do
    visit '/'
    fill_in('name', :with => 'Downtown')
    click_button('Add store')
    visit '/'
    expect(page).to have_content('Downtown')
    click_on('Downtown')
    fill_in('name', :with => 'Northside')
    click_button('Update Store')
    visit '/'
    expect(page).to have_content('Northside')
  end
end

describe 'the store shoe brand name', {:type => :feature} do
  it 'creates a store shoe brand name and price' do
    visit '/'
    click_link('View shoe brands')
    expect(page).to have_content('Add Shoe Brands')
    click_button('Add shoe')
    expect(page).to have_content('There appears to be an error')
  end
end
