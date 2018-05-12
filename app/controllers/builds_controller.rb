class BuildsController < ApplicationController
  before_action :set_build, only: [:show, :update, :destroy]

  # GET /builds
  def index
    @builds = Build.all

    @all_builds = []

    @builds.each do |build|
      @all_builds.append({
        build: {
          id: build.id,
          version: build.master_tag.to_s + '.' + build.dev_tag.to_s
        },
        file: {
          id: build.file_object.id,
          file_name: build.file_object.file_name,
          file_size: build.file_object.file_size,
          url: '/file_objects/' + build.file_object.id.to_s + '/' + build.file_object.file_name
        }
      })
    end

    render json: @all_builds
  end

  # GET /builds/1
  def show
    render json: @build
  end

  # POST /builds
  def create
    @build = Build.new(build_params)

    if @build.save
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
      params.require(:build).permit()
    end
end
