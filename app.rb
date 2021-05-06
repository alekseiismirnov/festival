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
