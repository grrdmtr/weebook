class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = @post.comments.find_by(comment_params)
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id)
  end
end