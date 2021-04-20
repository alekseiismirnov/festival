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
end
