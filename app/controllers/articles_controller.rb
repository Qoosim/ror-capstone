class ArticlesController < ApplicationController
  include SessionsHelper

  def index
      @articles = Article.all
      @categories = Category.cate_priority
  end

  def new
      @article = current_user.articles.build
  end

  def show
      @article = fetch_article
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to(@article, notice: 'Article created!')
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

  private

  def article_params
    params.require(:article).permit(:title, :text, :image, :category_id)
  end

  def fetch_article
    Article.find(params[:id])
  end
end
