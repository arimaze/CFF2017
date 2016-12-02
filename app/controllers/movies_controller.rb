class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  
  end
  
  def view_file
    @movie = Movie.find(params[:id])
   
  send_data(@movie.binary_data,
            type: @movie.content_type,
          filename: @movie.filename)
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end
 

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
       # format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
	     format.html {redirect_to action: "index"}
        #format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
		# @movie = Movie.find(params[:format])
		# @movie.filename = params[:file].original_filename
		# @movie.content_type= params[:file].content_type
		# @movie.binary_data= params[:file].read
		# @movie.update_attributes(movie_params)


    respond_to do |format|
      if @movie.update(movie_params)
      #  format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
	     format.html {redirect_to action: "index"}
        #format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
	
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:name, :content_type, :filename, :file)
    end
	
	
	
end
