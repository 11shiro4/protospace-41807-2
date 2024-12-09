class UsersController < ApplicationController
  before_action :set_user, only: :show

  def edit
  end

  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes 
    @user_name = @user.name
    @user_profile = @user.profile
    @user_occupation = @user.occupation
    @user_position = @user.position
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end  end

  private

  def user_params
    params.require(:user).permit(:name, :email)#確認
  end

  def set_user
    @user = User.find_by(id: params[:id])
    
  end
end
