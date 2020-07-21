class VotesController < ApplicationController
  include SessionsHelper

  def create
    @vote = current_user.votes.new(article_id: params[:article_id])
    @article = Article.find(params[:article_id])

    if @vote.save
      redirect_to(article_path(@article), notice: 'You voted this article.')
    else
      redirect_to(article_path(@article), notice: 'You cannot vote this article.')
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, article_id: params[:article_id])
    @article = Article.find(params[:article_id])
    if vote
      vote.destroy
      redirect_to(article_path(@article), notice: 'You unvoted this article.')
    else
      redirect_to(articles_path, notice: 'You cannot unvote article that you did not vote before.')
    end
  end

  # def index
  #     @votes = Vote.all
  # end

  # def new
  # end

  # def create
  #    @vote = Vote.new(vote_params, user_id: current_user)

  #    if @vote.save
  #         redirect_to article_path
  #         flash[:notice] = 'You voted for this article'
  #    else
  #         redirect_to article_path
  #         flash[:notice] = 'You unvoted this article'
  #     end
  # end

  # def destroy
  #     @vote = fetch_vote
  #     @vote.delete
  #     redirect_to article_path
  # end

  # private
  #     def vote_params
  #         params.require(:vote).permit(article_id: id)
  #     end

  #     def fetch_vote
  #         Vote.find(params[:id])
  #     end
end
