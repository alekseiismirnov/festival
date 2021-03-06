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
  @stages = Stage.all
  erb :stages
end

get '/stages/new' do
  erb :new_stage
end

post '/stages' do
  name = params[:stage_name]
  stage = Stage.new(name)
  stage.save
  @stages = Stage.all
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

delete '/stages/:id' do
  id = params[:id].to_i
  Stage.delete_stage id

  @stages = Stage.all
  erb :stages
end

get '/stages/:id/new_artist' do
  @id = params[:id].to_i
  erb :new_artist
end

post '/stages/:id' do
  @id = params[:id].to_i

  artist_name = params[:artist_name]
  artist = Artist.new(artist_name)
  artist.assign_to_stage @id
  artist.save
  stage = Stage.find @id
  stage.update params[:stage_name]
  @stage_name = stage.name
  @artists_list = Artist.find_by_stage @id
  erb :stage
end

get '/stages/:id/artists/:artist_id/edit' do
  @id = params[:id].to_i
  @artist_id = params[:artist_id].to_i

  @artist_name = Artist.find(@artist_id).name
  erb :edit_artist
end

patch '/stages/:id/artists/:artist_id' do
  artist_id = params[:artist_id].to_i
  artist = Artist.find artist_id

  artist.update params[:artist_name]

  @id = params[:id].to_i
  @stage_name = Stage.find(@id).name
  @artists_list = Artist.find_by_stage @id

  erb :stage
end

delete '/stages/:id/artists/:artist_id' do
  id = params[:id].to_i
  artist_id = params[:artist_id].to_i
  Artist.remove_artist artist_id

  @stage_name = Stage.find(id).name
  @artists_list = Artist.find_by_stage id

  erb :stage
end
