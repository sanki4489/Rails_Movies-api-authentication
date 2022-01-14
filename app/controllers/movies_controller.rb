class MoviesController < ApplicationController
    def index
        movies = Movie.all
        render json: movies, status: :ok
    end
    def show
        movies = Movie.find_by_id(params[:id])
        render json: movies, status: :ok
    end

    def new
        movie = Movie.new
    end

    def create
        movie = Movie.new(movies_params)
        if movie.save
            render json: movie, status: :created
        else
            render json: {message: "not authorized"}
        end
    end
    
    
    def update
        movie = Movie.find_by_id(params[:id])
        if movie && movie.update_attributes(movies_params)
            render json: movie
        else
            render json: {message: "Not possible"}
        end
    end
    
    # def edit
    #     movie = Movie.find_by_id(params[:id])
    # end
    
    def destroy
        movie = Movie.find_by_id(params[:id])
        if movie.destroy
            render json: {message: "data deleted"}
        else
            render json: {message: "Not authoriezed to delete"}
        end
    end
#dont add require into api only
private
    def movies_params
        params.permit(:name, :ratings, :durations)
    end
end
