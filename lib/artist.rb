# frozen_string_literal: true

require 'pry'

# Belongs to the one Stage, CRUD
class Artist
  attr_reader :name, :id, :stage_id

  @artists = {}
  @total_rows = 0

  def initialize(artist_name, id = nil)
    @name = artist_name
    @id = id || self.class.free_id
    @stage_id = nil
  end

  def self.free_id
    @total_rows += 1
  end

  def self.clear
    @artists = {}
  end

  def self.add_artist(artist)
    @artists[artist.id] = artist
  end

  def self.all
    @artists.values
  end

  def self.find(id)
    @artists[id]
  end

  def self.find_by_stage(stage_id)
    @artists.values.select do |artist|
      artist.stage_id == stage_id
    end
  end

  def ==(other)
    name == other.name
  end

  def save
    artist = Artist.new(name, id)
    artist.assign_to_stage stage_id
    Artist.add_artist artist
  end

  def assign_to_stage(stage_id)
    @stage_id = stage_id
  end
end
