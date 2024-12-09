class PrototypesController < ApplicationController
  ActiveRecord::RecordNotFound in PrototypesController#show
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.includes(:user).all
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)

    if @prototype.save
     
      redirect_to root_path
    else
      render :new
    end
  end


  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.destroy
      redirect_to root_path
    else
      redirect_to @prototype
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
    
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def user_authorized
    unless @prototype.user == current_user
      redirect_to root_path, alert: "アクセス権がありません。"
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end