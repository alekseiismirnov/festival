# frozen_string_literal: true

require 'pry'

# Belongs to the one Stage, CRUD
class Artist
  attr_reader :name, :id

  @artists = {}
  @total_rows = 0

  def initialize(artist_name, id = nil)
    @name = artist_name
    @id = id || self.class.free_id
  end

  def self.free_id
    @total_rows += 1
  end

  def self.clear
    @artists = {}
  end

  def self.add_artist(artist)
    @artists[artist.id] = Artist.new(artist.name, artist.id)
  end

  def self.all
    @artists.values
  end

  def self.find(id)
    @artists[id]
  end

  def ==(other)
    name == other.name
  end

  def save
    Artist.add_artist self
  end
end
