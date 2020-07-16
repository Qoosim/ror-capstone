class ArticlesController < ApplicationController
    before_action :logged_in_user

    include SessionsHelper

    def index
        @articles = Article.all
        @categories = Category.all
    end

    def new
        @article = current_user.articles.build
    end

    def show
        @article = fetch_article
    end

    def edit
        @article = fetch_article
    end

    def create
        @article = current_user.articles.build(article_params)
        if @article.save
            flash[:notice] = 'Article created successfully!'
            redirect_to article_path(@article)
        else
            render :new
        end
    end

    def update
        @article = fetch_article
        if @article.update(article_params)
            flash[:notice] = 'Article updated!'
            redirect_to @article
        else
            render :edit
        end
    end

    def upvote
        @article = fetch_article
        @article.upvote_from current_user
    end

    def downvote
        @article = fetch_article
        @article.downvote_from current_user
    end


    private
        def article_params
            params.require(:article).permit(:title, :text, :image, :category_id)
        end

        def fetch_article
            Article.find(params[:id])
        end

        def logged_in_user
            unless logged_in?
                flash[:notice] = "You need to login!"
                redirect_to login_path
            end
        end
end
