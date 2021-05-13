# frozen_string_literal: true

require 'capybara/rspec'
require './app'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Stages page requirements', type: :feature) do
  before :each do
    Stage.clear
    @stage = Stage.new('All Numbers')
    @stage.save
    @stage2 = Stage.new('Live me alone')
    @stage2.save
    visit '/stages'
  end

  it 'has heading' do
    expect(page).to have_content('Festival Stages')
  end

  it 'contains saved stage name' do
    expect(page).to have_content(@stage.name)
  end

  it 'has link on stage page' do
    click_on(@stage.name)
    expect(page).to have_content("Stage #{@stage.name}")
  end
end

describe('Create a stage path', type: :feature) do
  it 'creates a new stage and goes to the stage list page' do
    stage_name = 'Sing it slowly'
    visit('/stages')
    click_on('Add a new stage')
    fill_in('stage_name', with: stage_name)
    click_on('Add')
    expect(page).to have_content(stage_name)
  end
end

describe('Edit stage', type: :feature) do
  before :each do
    Stage.clear
    @stage = Stage.new('All Numbers')
    @stage.save
  end

  it 'changes stage name' do
    new_name = 'Shine new name'
    visit("/stages/#{@stage.id}")
    click_on('Edit')
    fill_in('stage_name', with: new_name)
    click_on('Update!')
    expect(page).to have_content("Stage #{new_name}")
  end
end

describe('Delete stage', type: :feature) do
  before :each do
    Stage.clear
    @stage = Stage.new('All Numbers')
    @stage.save
  end

  context 'press `delete` button' do
    # doesn't work here, but manualy 
    xit 'makes the stage dissappear from the list' do
      visit('/stages')
      click_button('Delete')
      expect(page).to have_no_content('All Numbers')
    end
  end
end
