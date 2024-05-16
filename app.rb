require 'sinatra'
require 'sinatra/activerecord'

set :database_file, 'config/database.yml'

class Note < ActiveRecord::Base
end

get '/' do
    erb :index
end

post '/notes' do
    Note.create(title: params[:title], content: params[:content])
    redirect '/notes'
end

get '/notes' do
    @notes = Note.all
    erb :"notes/index"
end

get '/notes/:id' do
    @note = Note.find(params[:id])
    erb :"notes/show"
end

put '/notes/:id' do 
    note = Note.find(params[:id])
    note.update(title: params[:title], content: params[:content])
    redirect '/notes'
end

delete '/notes/:id' do
    Note.find(params[:id]).destroy
    redirect '/notes'
end

