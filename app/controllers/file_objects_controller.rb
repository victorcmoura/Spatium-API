class FileObjectsController < ApplicationController
  before_action :set_file_object, only: [:show, :update, :destroy, :download]

  # GET /file_objects
  def index
    @file_objects = FileObject.all

    render json: @file_objects
  end

  # GET /file_objects/1
  def show
    @result = {
      id: @file_object.id,
      file_name: @file_object.file_name,
      file_size: @file_object.file_size,
      url: '/file_objects/' + @file_object.id.to_s + '/' + @file_object.file_name
    }
    render json: @result
  end

  # GET/file_objects/1/download
  def download
    @binary = @file_object.file.download
    send_data @binary
  end

  # POST /file_objects/master
  def upload_from_master
    # Instantiates new master Build
    @build = Build.new()
    @build.is_master = true
    if Build.all.last
      @build.master_tag = Build.all.last.master_tag + 1
    else
      @build.master_tag = 1
    end
    @build.dev_tag = 0
    @build.save

    # Loads file
    @file = params['file_object']

    # Instantiates new FileObject
    @file_object = FileObject.new()
    @file_object.file_name = @file.original_filename
    @file_object.file_size = @file.size
    @file_object.build_id = @build.id

    if @file_object.save
      if @file
        @file_object.file.attach(@file)
      end

      @result = {
        build: {
          id: @build.id,
          version: @build.master_tag.to_s + '.' + @build.dev_tag.to_s
        },
        file: {
          id: @file_object.id,
          file_name: @file_object.file_name,
          file_size: @file_object.file_size,
          url: '/file_objects/' + @file_object.id.to_s + '/' + @file_object.file_name
        }
      }

      render json: @result, status: :created, location: @file_object
    else
      render json: {file_object: @file_object.errors, build: @build.errors}, status: :unprocessable_entity
    end
  end

  # POST /file_objects/devel
  def upload_from_devel
    # Instantiates new master Build
    @build = Build.new()
    @build.is_master = false
    if Build.all.last
      @build.dev_tag = Build.all.last.dev_tag + 1
      @build.master_tag = Build.all.last.master_tag
    else
      @build.master_tag = 0
      @build.dev_tag = 1
    end
    @build.save

    # Loads file
    @file = params['file_object']

    # Instantiates new FileObject
    @file_object = FileObject.new()
    @file_object.file_name = @file.original_filename
    @file_object.file_size = @file.size
    @file_object.build_id = @build.id

    if @file_object.save
      if @file
        @file_object.file.attach(@file)
      end

      @result = {
        build: {
          id: @build.id,
          version: @build.master_tag.to_s + '.' + @build.dev_tag.to_s
        },
        file: {
          id: @file_object.id,
          file_name: @file_object.file_name,
          file_size: @file_object.file_size,
          url: '/file_objects/' + @file_object.id.to_s + '/' + @file_object.file_name
        }
      }

      render json: @result, status: :created, location: @file_object
    else
      render json: {file_object: @file_object.errors, build: @build.errors}, status: :unprocessable_entity
    end
  end

  # POST /file_objects
  def create
    @file_object = FileObject.new()
    @file = params['file_object']
    @file_object.file_name = @file.original_filename
    @file_object.file_size = @file.size

    if @file_object.save
      if @file
        @file_object.file.attach(@file)
      end
      render json: @file_object, status: :created, location: @file_object
    else
      render json: @file_object.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /file_objects/1
  def update
    if @file_object.update(file_object_params)
      render json: @file_object
    else
      render json: @file_object.errors, status: :unprocessable_entity
    end
  end

  # DELETE /file_objects/1
  def destroy
    @file_object.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_object
      @file_object = FileObject.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def file_object_params
      params.fetch(:file_object, {})
    end
end
