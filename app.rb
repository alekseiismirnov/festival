# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'pry'

require './lib/stage.rb'
require './lib/artist.rb'

also_reload 'lib/**/*.rb'

get '/' do
  'Hi there'
end

get '/stages' do
  erb :stages
end

get '/stages/new' do
  erb :new_stage
end

post '/stages' do
  name = params[:stage_name]
  stage = Stage.new(name)
  stage.save
  erb :stages
end

get '/stages/:id' do
  @id = params[:id].to_i
  stage = Stage.find @id
  @stage_name = stage.name
  @artists_list = Artist.find_by_stage @id
  erb :stage
end

get '/stages/:id/edit' do
  @id = params[:id].to_i
  stage = Stage.find @id
  @stage_name = stage.name
  erb :edit_stage
end

patch '/stages/:id' do
  @id = params[:id].to_i
  stage = Stage.find @id
  stage.update params[:stage_name]
  @stage_name = stage.name
  @artists_list = Artist.find_by_stage @id
  erb :stage
end


