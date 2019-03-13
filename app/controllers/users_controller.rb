class UsersController < ApplicationController
  def index
    @users = User.where(public: true)
  end

  def show
    @user = User.find(params[:id])
    @photos = @user.photos
  end
end
