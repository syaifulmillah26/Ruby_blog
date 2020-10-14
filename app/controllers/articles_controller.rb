class ArticlesController < ApplicationController
    ## spesific action for require authentication
    before_action :authenticate_user!, :except => [:index, :show,]
    before_action :verify_is_admin_and_editor, :except => [:index, :show,]

    def index
        @categories = Category.all
        cate = params[:cate]

        if !cate.nil?
            @articles = Article.where(:category_id => cate)
        else
            @search = Article.search(params[:q])
            @articles = @search.result
        end
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def new
        @article = Article.new

    end
    
    def create  
        @article = Article.new(article_params)
        if @article.save
            redirect_to @article
            flash.notice = "Article has been created!"
        else
            render 'new'
        end
    end
    
    def edit
        @article = Article.find(params['id'])
    end
    
    def update
        @article = Article.find(params['id'])
        if @article.update(article_params)
            redirect_to @article
            flash.notice = "Article has been updated!"
        else
            render 'edit'
        end
    end
    
    def destroy
        @article = Article.find(params['id'])
        @article.destroy
        redirect_to articles_path
        flash.alert = "Article has been deleted!"
    end
    
    private
	  def article_params
	    params.require(:article).permit(:title, :text, :image, :category_id, tags_attributes: [:id, :description, :done, :_destroy])
	  end
    
end
