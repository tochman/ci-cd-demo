class CommentsController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    Comment.create(comment_params.merge!(article: article))
    redirect_to root_path
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      redirect_to root_path, notice: 'Your comment has been deleted'
    else
      redirect_to root_path, notice: comment.errors.full_messages.to_sentence
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :name)
  end
end
