module VotesHelper
    def vote_unvote(article)
        vote = Vote.find_by(article: article, user: current_user)
        if vote
          link_to('Unvote', article_vote_path(id: vote.id, article_id: article.id), method: :delete, class: 'votes')
        else
          link_to('Vote', article_votes_path(article_id: article.id), method: :post, class: 'votes')
        end
    end
end
