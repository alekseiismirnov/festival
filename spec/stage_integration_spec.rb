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
