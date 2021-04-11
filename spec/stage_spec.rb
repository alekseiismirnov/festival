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

  describe '#save' do
    it 'saves item to the db' do
      stage1 = Stage.new
      stage2 = Stage.new
      stage1.save
      stage2.save
      expect(Stage.all.length).to eq(2)
    end
  end
end
