class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @post = @comment.post
    if @comment.save
      redirect_to @post
    else
      render 'posts/show'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
end
