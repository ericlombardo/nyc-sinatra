class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  
  get '/figures/new' do 
    @lmarks = get_lmarks
    @titles = get_titles
    erb :"figures/new"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :"figures/show"
  end
  
  post '/figures' do
    @figure = create_figure
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @lmarks = Landmark.all
    @titles = Title.all
    erb :"figures/edit"
  end

  patch '/figures/:id' do
    @figure = update_figure
    erb :"/figures/show"
  end

end
