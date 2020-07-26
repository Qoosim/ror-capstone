module ArticlesHelper
  def featured_article
    if Article.joins(:votes).group('article_id').count.first.nil?
      Article.first || flash[:notice] = 'No featured article to display!'
    else
      @feature_article_id = Article.joins(:votes).group('article_id').count.collect { |id, vote| [vote, id] }
      feature_article_top = @feature_article_id.max[1]
      Article.find(feature_article_top)
    end
  end

  def articles_exist
    article = featured_article
    if article.class == Article
      render 'if_not_nil', featured_article: article
    else
      render 'if_nil', featured_article: article
    end
  end

  def display_latest_articles(cate)
    if cate.articles.empty?

    else
      render 'partial_2', cate: cate
    end
  end
end
