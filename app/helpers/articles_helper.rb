module ArticlesHelper
    def featured_article
        @feature_article_id = Article.joins(:votes).group('article_id').count.first[0]
        Article.find(@feature_article_id)
    end

end
