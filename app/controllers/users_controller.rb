class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  #before_action :set_user, only: :show

  def edit
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes 
    @user_name = @user.name
    @user_profile = @user.profile
    @user_occupation = @user.occupation
    @user_position = @user.position
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      @user.image.purge if @user.image.attached?
      render "new"
    end
  end#create全て追記

  def update
    @user = User.find(params[:id])
    if @user.update(post_params)
      redirect_to @user
    else
      # 保持したいデータはそのまま、画像は再入力を促す
      @user.image.purge if @user.image.attached?
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)#確認
  end

  def set_user
    @user = User.find_by(id: params[:id])
    
  end
end
