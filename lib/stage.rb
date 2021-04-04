# frozen_string_literal: true

# Just has many artists. Should has backend for CRUD requests.
class Stage
  @@stages = []

  def self.clear; end

  def self.all
    @@stages
  end
end
