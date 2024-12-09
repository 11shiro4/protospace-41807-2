class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id]) 
    @comment = @prototype.comments.new(comment_params)
    @comment.user = current_user  # 現在のユーザーをコメントに関連付ける


    if @comment.save
      redirect_to prototype_path(@prototype)
    else
      @comments = @prototype.comments.includes(:user)  
      render "prototypes/show", status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end