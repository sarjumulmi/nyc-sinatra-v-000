class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    # binding.pry
    figure = Figure.create(params[:figure])
    if !params[:landmark][:name].empty?
      figure.landmarks.create(params[:landmark])
    end
    if !params[:title][:name].empty?
      figure.titles.create(params[:title])
    end
    redirect "/figures/#{figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    # binding.pry
    figure = Figure.find(params[:id])
    figure.update(params[:figure])
    if !params[:landmark][:name].empty?
      figure.landmarks.create(params[:landmark])
    end
    if !params[:title][:name].empty?
      figure.titles.create(params[:title])
    end
    redirect "/figures/#{figure.id}"
  end

end