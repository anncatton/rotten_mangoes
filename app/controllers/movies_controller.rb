class MoviesController < ApplicationController

  def index
    
    title = "%#{params[:title]}%"
    director = "%#{params[:director]}%"
    runtime = params[:runtime_in_minutes]

    @movies = Movie.all

    if title
      @movies = @movies.title(title)
    end

    if director
      @movies = @movies.director(director)
    end

    if runtime == "Less than 90 minutes"
      @movies = @movies.under_90_minutes
    elsif runtime == "Between 90 and 120 minutes"
      @movies = @movies.between_90_and_120_minutes
    elsif runtime == "Over 120 minutes"
      @movies = @movies.over_120_minutes
    elsif runtime == "blank"
      @movies
    end

    if @movies.empty?
      flash.now[:notice] = "Sorry, no movie matches that criteria!"
    end

  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end

  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(:title, :director, :runtime_in_minutes, :description, :poster_image, :release_date, :poster_image_url)
  end

end

