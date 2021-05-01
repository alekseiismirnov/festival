# frozen_string_literal: true

require 'rspec'
require 'pry'

require 'artist'
require 'stage'

context 'Artist-Stage relations' do
  before :each do
    Artist.clear
    @artist1 = Artist.new('First Artist Name')
    @artist2 = Artist.new('Second Artist Name')
    @artist1.save
    @artist2.save

    @stage = Stage.new('All Numbers')
    @stage.save
    @artists_list = []
    (1..10).each do |i|
      artist = Artist.new("Artist #{i}")
      artist.assign_to_stage @stage.id
      artist.save
      @artists_list << artist
    end
  end

  describe 'Artist' do
    describe '.find_by_stage' do
      it 'finds all artists performing on given stage' do
        expect(Artist.find_by_stage(@stage.id)).to eq(@artists_list)
      end
    end
  end
end
