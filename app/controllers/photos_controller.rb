class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json

  def index
    @photos = Photo.all
  end


  # def store
  #   # upload image to cloudinary
  #   @value = Cloudinary::Uploader.upload(params[:image])

  #   # create a new post object and save to db
  #   @photo = Photo.new({:link => @value['secure_url'], :caption => params[:caption]})

  #  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    if user_signed_in?
      @photo = Photo.new
    else
     redirect_to new_user_session_path
    end

  end

  # GET /photos/1/edit
  def edit
    if current_user.id == @photo.user_id
    else redirect_to new_user_session_path
    end
  end

  # POST /photos
  # POST /photos.json
  def create
    if user_signed_in?
      @photo = Photo.new(photo_params)
      @photo.user_id = current_user.id
      @photo.save
    end

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Votre photo à été crée avec succès.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    if current_user.id == @photo.user_id
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Votre photo à été modifié avec succès.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
    else redirect_to new_user_session_path
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :content, :long, :lat, :date, :user_id, :file)
    end
end
