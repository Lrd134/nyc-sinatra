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
      redirect :"/figures/#{figure.id}"
    

  end
  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(params[:figure])
    redirect :"/figures/#{figure.id}"
  end
end
