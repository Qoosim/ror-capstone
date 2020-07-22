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
end
