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
    erb :'/landmarks/edit'
  end
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end
  post '/landmarks' do
    binding.pry

    landmark = Landmark.create(params[:landmark])
    
    unless !landmark.figure_id
      landmark.figure_id = Figure.create(params[:figure]).id
    end
    
    landmark.save
      # title = Title.create(params[:title])
      # params[:landmark][:title_ids][] << title.id
      # landmark = Landmark.create(params[:landmark])
      # params[:landmark][:landmark_ids][] << landmark.id
    redirect :"/landmarks/#{landmark.id}"
  end
  patch '/landmarks/:id' do
    landmark = Landmark.find(params[:id])
    landmark.update(params[:landmark])
    unless params[:landmark][:name].empty?
      landmark.landmarks << Landmark.create(params[:landmark])
    end
    unless params[:title][:name].empty?
      landmark.titles << Title.create(params[:title])
    end
    redirect :"/landmarks/#{landmark.id}"
  end
end
