# frozen_string_literal: true

require 'capybara/rspec'
require './app'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Artist: create, edit, delete', type: :feature) do
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

  context 'create new artist item from the scene page' do
    it 'adds new artist name to the list' do
      new_artist_name = 'Somebody Random'
      visit "/stages/#{@stage.id}"
      click_on 'Add artist'
      fill_in('artist_name', with: new_artist_name)
      click_on 'Add'
      expect(page).to have_content(new_artist_name)
    end
  end

  context 'edit artist' do
    before :each do
      @artist = @artists_list.sample
      @artist_old_name = @artist.name
      @artist_new_name = 'Same But Different'
      visit "/stages/#{@stage.id}"
      click_on @artist.name
      fill_in('artist_name', with: @artist_new_name)
      click_on 'Update'
    end

    it 'makes new artist name appears in artists list' do
      expect(page).to have_content(@artist_new_name)
    end

    it 'makes old artst name dissappear from the list' do
      expect(page).to have_no_content(@artist_old_name)
    end
  end
end
