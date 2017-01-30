class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @movies = Movie.all
  end

  def show
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to action: :show, id: @movie.id
    else
      render :edit, id: @movie.id
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to action: :show, id: @movie.id
    else
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :release_date, :description)
  end

  def set_movie
    id = params['id']
    @movie = Movie.find(id)
  rescue ActiveRecord::RecordNotFound
    render file: "#{Rails.root}/public/404.html", status: 404
  end
end
