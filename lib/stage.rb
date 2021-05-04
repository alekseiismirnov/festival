# frozen_string_literal: true

require 'pry'

# Just has many artists. Should has backend for CRUD requests.
class Stage
  attr_reader :id, :name

  @stages = {}
  @total_rows = 0

  def initialize(name, id = nil)
    @name = name
    @id = id || self.class.free_id
  end

  def self.free_id
    @total_rows += 1
  end

  def self.clear
    @stages = {}
  end

  def self.add_stage(stage)
    @stages[stage.id] = Stage.new(stage.name, stage.id)
  end

  def self.all
    @stages.values
  end

  def self.find(id)
    @stages[id]
  end

  def self.delete_stage(id)
    @stages.delete(id)
  end

  def save
    self.class.add_stage self
  end

  def ==(other)
    name == other.name
  end

  def update(new_name)
    @name = new_name
    save
  end

  def delete
    self.class.delete_stage(id)
  end
end
