module ArticlesHelper
    def featured_article
        if Article.joins(:votes).group('article_id').count.first.nil?
            flash[:notice] = "No Article available"
        else
            @feature_article_id = Article.joins(:votes).group('article_id').count.collect { |id, vote| [vote, id] }
            feature_article_top = @feature_article_id.max[1]
            Article.find(feature_article_top)
        end
    end

    def display_latest_articles
        @categories.collect do |cate|
            if cate.articles.first.nil?
                flash[:notice] = "No Article created!"
            else
                link_to(link_to cate.name, cate, class: 'category')
                cate.latest_article.first.title
                image_tag(cate.latest_article.first.image.url,
                                        height: "240", width: "334", class: 'all-images')
            end
        end
    end

end
