require 'capybara/rspec'
require './app'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Stages page requirements', type: :feature) do
  before :each do
    Artist.clear
    @artist1 = Artist.new('First Artist Name')
    @artist2 = Artist.new('Second Artist Name')
    @artist1.save
    @artist2.save

    @stage = Stage.new('All Numbers')
    @stage.save
    @stage2 = Stage.new('Live me alone')
    @stage2.save
    @artists_list = []
    (1..10).each do |i|
      artist = Artist.new("Artist #{i}")
      artist.assign_to_stage @stage.id
      artist.save
      @artists_list << artist
    end
    visit '/stages'
  end

  it 'has heading' do
    expect(page).to have_content('Festival Stages')
  end

  it 'contains saved stage name' do
    expect(page).to have_content(@stage.name)
  end
end
