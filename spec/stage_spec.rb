# frozen_string_literal: true

require 'rspec'
require 'pry'

require 'stage'

describe '#Stage' do
  before 'each' do
    Stage.clear
  end

  describe '.all' do
    it 'returns empty list when database is clearl' do
      expect(Stage.all).to eq([])
    end
  end
end
