class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes 
    @user_name = @user.name
    @user_profile = @user.profile
    @user_occupation = @user.occupation
    @user_position = @user.position


  private

  def user_params
    params.require(:user).permit(:name, :email)#確認
  end

  def set_user
    @user = User.find_by(id: params[:id])
    
  end
end
