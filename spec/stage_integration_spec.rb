require 'capybara/rspec'
require './app'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Stages page requirements', type: :feature) do
  before :each do
    Stage.clear
    @stage = Stage.new('All Numbers')
    @stage.save
    @stage2 = Stage.new('Live me alone')
    @stage2.save
    visit '/stages'
  end

  it 'has heading' do
    expect(page).to have_content('Festival Stages')
  end

  it 'contains saved stage name' do
    expect(page).to have_content(@stage.name)
  end
end
