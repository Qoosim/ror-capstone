class ArticlesController < ApplicationController
    include SessionsHelper

    def index
        @articles = Article.all
    end

    def new
        @article = current_user.articles.build
    end

    def show
        @article = Article.find(params[:id])
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = current_user.articles.build(article_params)
        if @article.save
            flash[:notice] = 'Article created successfully!'
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def upvote
        @article = Article.find(params[:id])
        @article.upvote_from current_user
    end

    def downvote
        @article = Article.find(params[:id])
        @article.downvote_from current_user
    end


    private
        def article_params
            params.require(:article).permit(:title, :text, :image)
        end
end
