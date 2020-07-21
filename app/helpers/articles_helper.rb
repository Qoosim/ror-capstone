module ArticlesHelper
  def featured_article
    if Article.joins(:votes).group('article_id').count.first.nil?
      flash[:notice] = 'No Article available'
    else
      @feature_article_id = Article.joins(:votes).group('article_id').count.collect { |id, vote| [vote, id] }
      feature_article_top = @feature_article_id.max[1]
      Article.find(feature_article_top)
    end
  end
end
