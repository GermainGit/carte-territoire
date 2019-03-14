class UsersController < ApplicationController
  def index
    @users = User.all

  end

  def show
    @user = User.find(params[:id])
    @photos = @user.photos
  end


  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Utilisateur supprimé."
    redirect_to users_path
  end
end
