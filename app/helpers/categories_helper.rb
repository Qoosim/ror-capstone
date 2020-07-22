module CategoriesHelper

    def available_category(cate)
        if cate.articles.empty?

        else
            render "available", cate: cate
        end
    end
end
