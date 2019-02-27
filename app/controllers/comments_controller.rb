class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    article = Article.find(params[:article_id])
    Comment.create(comment_params.merge!(article: article, user: current_user))
    redirect_to root_path
  end

  def destroy
    comment = Comment.find(params[:id])
    authorize comment, :destroy?
    if comment.destroy
      redirect_to root_path, notice: 'Your comment has been deleted'
    else
      redirect_to root_path, notice: 'You are not allowed to perform this action'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :name)
  end

end
