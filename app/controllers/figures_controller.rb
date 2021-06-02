class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end
  post '/figures' do
    figure = Figure.create(params[:figure])
    unless params[:landmark][:name].empty?
      figure.landmarks << Landmark.create(params[:landmark])
    end
    unless params[:title][:name].empty?
      figure.titles << Title.create(params[:title])
    end
    figure.save
      # title = Title.create(params[:title])
      # params[:figure][:title_ids][] << title.id
      # landmark = Landmark.create(params[:landmark])
      # params[:figure][:landmark_ids][] << landmark.id
    redirect :"/figures/#{figure.id}"
  end
  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(params[:figure])
    unless params[:landmark][:name].empty?
      figure.landmarks << Landmark.create(params[:landmark])
    end
    unless params[:title][:name].empty?
      figure.titles << Title.create(params[:title])
    end
    redirect :"/figures/#{figure.id}"
  end
end
