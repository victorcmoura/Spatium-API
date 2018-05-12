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
          version: build.master_tag.to_s + '.' + build.dev_tag.to_s,
          plataform: build.plataform
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

  # GET /builds/Windows
  def windows_builds
    @builds = Build.all

    @all_builds = []

    @builds.each do |build|
      if build.plataform == 'Windows'
        @all_builds.append({
          build: {
            id: build.id,
            version: build.master_tag.to_s + '.' + build.dev_tag.to_s,
            plataform: build.plataform
          },
          file: {
            id: build.file_object.id,
            file_name: build.file_object.file_name,
            file_size: build.file_object.file_size,
            url: '/file_objects/' + build.file_object.id.to_s + '/' + build.file_object.file_name
          }
        })
      end
    end

    render json: @all_builds
  end

  # GET /builds/Linux
  def linux_builds
    @builds = Build.all

    @all_builds = []

    @builds.each do |build|
      if build.plataform == 'Linux'
        @all_builds.append({
          build: {
            id: build.id,
            version: build.master_tag.to_s + '.' + build.dev_tag.to_s,
            plataform: build.plataform
          },
          file: {
            id: build.file_object.id,
            file_name: build.file_object.file_name,
            file_size: build.file_object.file_size,
            url: '/file_objects/' + build.file_object.id.to_s + '/' + build.file_object.file_name
          }
        })
      end
    end

    render json: @all_builds
  end

  # GET /builds/OSX
  def osx_builds
    @builds = Build.all

    @all_builds = []

    @builds.each do |build|
      if build.plataform == 'OSX'
        @all_builds.append({
          build: {
            id: build.id,
            version: build.master_tag.to_s + '.' + build.dev_tag.to_s,
            plataform: build.plataform
          },
          file: {
            id: build.file_object.id,
            file_name: build.file_object.file_name,
            file_size: build.file_object.file_size,
            url: '/file_objects/' + build.file_object.id.to_s + '/' + build.file_object.file_name
          }
        })
      end
    end

    render json: @all_builds
  end

  # GET /builds/latest
  def show_latest
    @result = []

    @last_build = Build.all.last
    if @last_build
      @latest_builds = Build.where(:master_tag => @last_build.master_tag, :dev_tag => @last_build.dev_tag)
      @latest_builds.each do |build|
        @result.append({
          build: {
            id: build.id,
            version: build.master_tag.to_s + '.' + build.dev_tag.to_s,
            plataform: build.plataform
          },
          file: {
            id: build.file_object.id,
            file_name: build.file_object.file_name,
            file_size: build.file_object.file_size,
            url: '/file_objects/' + build.file_object.id.to_s + '/' + build.file_object.file_name
          }
        })
      end
    end

    render json: @result
  end

  # GET /builds/latest_stable/
  def show_latest_stable
    @result = []

    @last_build = Build.all.last
    if @last_build
      @latest_builds = Build.where(:master_tag => @last_build.master_tag, :dev_tag => 0)
      @latest_builds.each do |build|
        @result.append({
          build: {
            id: build.id,
            version: build.master_tag.to_s + '.' + build.dev_tag.to_s,
            plataform: build.plataform
          },
          file: {
            id: build.file_object.id,
            file_name: build.file_object.file_name,
            file_size: build.file_object.file_size,
            url: '/file_objects/' + build.file_object.id.to_s + '/' + build.file_object.file_name
          }
        })
      end
    end

    render json: @result
  end

  # GET /builds/latest_stable/Windows
  def show_latest_stable_windows
    @result = []

    @last_build = Build.all.last
    if @last_build
      @latest_builds = Build.where(:master_tag => @last_build.master_tag, :dev_tag => 0, :plataform => 'Windows')
      @latest_builds.each do |build|
        @result.append({
          build: {
            id: build.id,
            version: build.master_tag.to_s + '.' + build.dev_tag.to_s,
            plataform: build.plataform
          },
          file: {
            id: build.file_object.id,
            file_name: build.file_object.file_name,
            file_size: build.file_object.file_size,
            url: '/file_objects/' + build.file_object.id.to_s + '/' + build.file_object.file_name
          }
        })
      end
    end

    render json: @result
  end

  # GET /builds/latest_stable/Linux
  def show_latest_stable_linux
    @result = []

    @last_build = Build.all.last
    if @last_build
      @latest_builds = Build.where(:master_tag => @last_build.master_tag, :dev_tag => 0, :plataform => 'Linux')
      @latest_builds.each do |build|
        @result.append({
          build: {
            id: build.id,
            version: build.master_tag.to_s + '.' + build.dev_tag.to_s,
            plataform: build.plataform
          },
          file: {
            id: build.file_object.id,
            file_name: build.file_object.file_name,
            file_size: build.file_object.file_size,
            url: '/file_objects/' + build.file_object.id.to_s + '/' + build.file_object.file_name
          }
        })
      end
    end

    render json: @result
  end

  # GET /builds/latest_stable/OSX
  def show_latest_stable_osx
    @result = []

    @last_build = Build.all.last
    if @last_build
      @latest_builds = Build.where(:master_tag => @last_build.master_tag, :dev_tag => 0, :plataform => 'OSX')
      @latest_builds.each do |build|
        @result.append({
          build: {
            id: build.id,
            version: build.master_tag.to_s + '.' + build.dev_tag.to_s,
            plataform: build.plataform
          },
          file: {
            id: build.file_object.id,
            file_name: build.file_object.file_name,
            file_size: build.file_object.file_size,
            url: '/file_objects/' + build.file_object.id.to_s + '/' + build.file_object.file_name
          }
        })
      end
    end

    render json: @result
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
