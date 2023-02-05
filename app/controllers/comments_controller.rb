class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find_by(comment_params)
    if @comment.save
      redirect_to request.referrer
      flash[:notice] = "Comment posted."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content,:user_id)
  end
end