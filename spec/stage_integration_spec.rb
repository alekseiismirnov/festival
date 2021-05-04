require 'capybara/rspec'
require './app'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Stages page requirements', type: :feature) do
  before :each do
    visit '/stages'
  end

  it 'has heading' do
    expect(page).to have_content('Festival Stages')
  end
end
