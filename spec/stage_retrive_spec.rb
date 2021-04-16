# frozen_string_literal: true

require 'rspec'
require 'pry'

require 'stage'

describe '#Stage' do
  context 'Retrive' do
    before 'each' do
      Stage.clear
      @stage1 = Stage.new('One')
      @stage2 = Stage.new('Two')

      @stage1.save
      @stage2.save
    end

    describe '.find' do
      it 'finds element by id' do
       expect(Stage.find(@stage2.id)).to eq(@stage2)
      end
    end
  end
end
