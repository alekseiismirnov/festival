# frozen_string_literal: true

class Stage
  @@stages = []

  def self.clear; end

  def self.all
    return @@stages
  end
end
