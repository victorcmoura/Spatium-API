class BuildsController < ApplicationController
  before_action :set_build, only: [:show, :update, :destroy]

  # GET /builds
  def index
    @builds = Build.all

    render json: @builds
  end

  # GET /builds/1
  def show
    render json: @build
  end

  # POST /builds
  def create
    @file = params[:file]
    build_params = params
    puts "="*81
    puts params
    puts "="*81
    @build = Build.new(build_params)



    if @build.save
      if @file
          @build.file.attach(@file)
      end
      render json: @build, status: :created, location: @build
    else
      render json: @build.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /builds/1
  def update
    if @build.update(build_params)
      render json: @build
    else
      render json: @build.errors, status: :unprocessable_entity
    end
  end

  # DELETE /builds/1
  def destroy
    @build.destroy
  end

  private
    def set_build
      @build = Build.find(params[:id])
    end

    def build_params
      params.require(:build).permit!
    end
end
