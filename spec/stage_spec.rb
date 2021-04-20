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

  describe '#upadte' do
    it 'changes the stage name' do
      new_name = 'Dash'
      stage = Stage.new('One')
      stage.save
      stage.update(new_name)
      expect(Stage.find(stage.id).name).to eq(new_name)
    end
  end

  describe '#delete' do
    before :each do
      Stage.clear
      @stage1 = Stage.new('One')
      @stage2 = Stage.new('Two')
      @stage1.save
      @stage2.save
    end

    it 'reduces general number of stages' do
      @stage1.delete
      expect(Stage.all.length).to eq(1)
    end

    it 'you`ll not find this stage again' do
      @stage1.delete
      expect(Stage.find(@stage1.id)).to eq(nil)
    end
  end
end
