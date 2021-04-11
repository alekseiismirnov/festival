# frozen_string_literal: true

# Just has many artists. Should has backend for CRUD requests.
class Stage
  @stages = []

  def self.clear; end

  def self.add_stage(stage)
    @stages << stage
  end

  def self.all
    @stages
  end

  def save
    self.class.add_stage self
  end
end
