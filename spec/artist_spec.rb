# frozen_string_literal: true

require 'rspec'
require 'pry'

require 'artist'

describe '#Artist' do
  before :each do
    Artist.clear
    @artist1 = Artist.new('First Artist Name')
    @artist2 = Artist.new('Second Artist Name')
    @artist1.save
    @artist2.save
  end

  describe '.all' do
    it 'returns empty list if db is empty' do
      Artist.clear
      expect(Artist.all).to eq([])
    end
  end

  describe '#save' do
    it 'number of .all is equal to the number of saved' do
      expect(Artist.all.length).to eq(2)
    end
  end

  describe '.find' do
    it 'finds the artists by an id' do
      artist = Artist.find(@artist2.id)
      expect(artist).to eq(@artist2)
    end
  end

  describe '.find_by_stage' do
    it 'finds all artists performing on given stage' do
      stage = Stage.new('All Numbers')
      stage.save
      artists_list = []
      (1..10).each do |i|
        artist = Artist.new("Artist #{i}")
        artist.assign_to_stage stage.id
        artist.save
        artists_list << artist
      end
      expect(Artist.find_by_stage(stage.id)).to eq(artists_list)
    end
  end
end
