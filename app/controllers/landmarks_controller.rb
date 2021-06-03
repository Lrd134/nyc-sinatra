class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end
  get '/landmarks/new' do
    @figures = Figure.all
    erb :'/landmarks/new'
  end
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    unless @landmark.figure_id == nil
      @figure = Figure.find(@landmark.figure_id)
    end
    @figures = Figure.all
    erb :'/landmarks/edit'
  end
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end
  post '/landmarks' do

    landmark = Landmark.create(params[:landmark])
    
    landmark.figure_id ? nil : landmark.figure_id = Figure.create(params[:figure]).id
    
    
    landmark.save
      # title = Title.create(params[:title])
      # params[:landmark][:title_ids][] << title.id
      # landmark = Landmark.create(params[:landmark])
      # params[:landmark][:landmark_ids][] << landmark.id
    redirect :"/landmarks/#{landmark.id}"
  end
  patch '/landmarks/:id' do
    landmark = Landmark.find(params[:id])
    params[:landmark][:figure_id] == "" ? figure=(Figure.create(params[:figure])) : nil
    if figure
      params[:landmark][:figure_id] = figure.id
    end
    landmark.update(params[:landmark])
    redirect :"/landmarks/#{landmark.id}"
  end
end
