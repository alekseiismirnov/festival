# frozen_string_literal: true

require 'rspec'
require 'pry'

require 'stage'

describe '#Stage' do
  before 'each' do
    Stage.clear
  end

  describe '.all' do
    it 'returns empty list when database is clear' do
      expect(Stage.all.length).to eq(0)
    end
  end

  describe '#save' do
    it 'a nuber of items in the db is equal to the number of saved' do
      stage1 = Stage.new('One')
      stage2 = Stage.new('Two')
      stage1.save
      stage2.save
      expect(Stage.all.length).to eq(2)
    end
  end
end
