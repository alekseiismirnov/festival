# frozen_string_literal: true

require 'capybara/rspec'
require './app'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('routing to the stage page', type: :feature) do
  before :each do
    Stage.clear

    @stage = Stage.new('All Numbers')
    @stage.save
    @stage2 = Stage.new('Nobody here')
    @stage2.save
    @artists_list = []
    (1..10).each do |i|
      artist = Artist.new("Artist #{i}")
      artist.assign_to_stage @stage.id
      artist.save
      @artists_list << artist
    end
  end

  context 'with no artists' do
    before :each do
      visit "/stages/#{@stage2.id}"
    end
    it 'shows `no artists` message' do
      expect(page).to have_content('Empty stage') 
    end
  end
end
