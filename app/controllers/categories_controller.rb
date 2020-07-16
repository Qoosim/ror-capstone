class CategoriesController < ApplicationController
    before_action :logged_in_user
    include SessionsHelper

    def index
        @categories = Category.all
        @articles = Article.all
    end

    def new
        @category = Category.new
    end

    def show
        @category = fetch_category
        @articles = Article.where(category_id: fetch_category)
    end

    def edit
        @category = fetch_category
    end

    def create
        @category = Category.create(category_params)

        if @category.save
            flash[:notice] = 'Category created!'
            redirect_to @category
        else
            render :new
        end
    end

    private
        def category_params
            params.require(:category).permit(:name)
        end

        def fetch_category
            Category.find(params[:id])
        end

        def logged_in_user
            unless logged_in?
                flash[:notice] = "Try to login!"
                redirect_to login_path
            end
        end
end
