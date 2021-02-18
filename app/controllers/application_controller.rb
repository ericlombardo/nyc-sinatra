class ApplicationController < Sinatra::Base
  set :views, proc { File.join(root, '../views/') }
  register Sinatra::Twitter::Bootstrap::Assets

  configure do 
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) } 
  end

  get '/' do
    erb :"application/index"
  end


  private

  helpers do
    def get_lmarks # get all landmarks
      Landmark.all
    end
    def get_titles  # get all titles
      Title.all
    end

    def new_title?  # check for new title, #=> hash or false
      params[:title][:name].empty? ? false : params[:title]
    end
    
    def new_landmark? # check for new landmark, #=> hash or false
      params[:landmark].first.any?("") ? false : params[:landmark]
    end
  end

  def create_figure #create figure, create title and landmark and link if present
  figure = Figure.create(params[:figure])
  figure.titles.create(new_title?) if !!new_title?
  figure.landmarks.create(new_landmark?) if !!new_landmark?
  figure
  end

  def update_figure
    figure = Figure.find(params[:id])
    figure.update(params[:figure])
    figure.titles.create(new_title?) if !!new_title?
    figure.landmarks.create(new_landmark?) if !!new_landmark?
    figure
  end
end
