class VotesController < ApplicationController
    include SessionsHelper

    def create
        @vote = current_user.votes.new(article_id: vote_params)
        @article = Article.find(params[:article_id])
    
        if @vote.save
            redirect_to(article_path(@article), notice: 'You voted this article.')
        else
          redirect_to(article_path(@article), notice: 'You cannot vote this article.')
        end
    end
    
    def destroy
      vote = Vote.find_by(user: current_user, article_id: vote_params)
      @article = Article.find(vote_params)
      if vote
        vote.destroy
        redirect_to(article_path(@article), notice: 'You unvoted this article.')
      else
        redirect_to(articles_path, notice: 'You cannot unvote article that you did not vote before.')
      end
    end


    private
      def vote_params
        params.require(:article_id)
      end
end
