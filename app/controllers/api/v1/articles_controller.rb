class Api::V1::ArticlesController < ActionController::API
    # before_action :authenticate_user!, :except => [:index, :show,]
    # before_action :verify_is_admin_and_editor, :except => [:index, :show,]
    def index
        articles = Article.order('created_at DESC'); 
        render json: {status: 'SUCCESS', message: 'Loaded articles', data:articles.as_json},status: :ok
    end

    def show 
        article = Article.find(params[:id])
        render json: {status: 'Success', message: 'Loaded article', data:article}, status: :ok
    end

    def create 
        article = Article.new(article_params)
        if article.save 
            render json: {status: 'Success', message: 'Article Saved', data:article}, status: :ok
        else
            render json: {status: 'Error', message: 'Article not saved', data:article.errors},status: :unprocessable_entity
        end
    end

    def update 
        article = Article.find(params[:id])
        if article.update(article_params)
            render json: {status: 'Success', message: 'Article Updated', data:article}, status: :ok
        else
            render json: {status: 'Error', message: 'Article not updated', data:article.errors},status: :unprocessable_entity
        end
    end

    def destroy 
        artilce = Article.find(params[:id])
        article.destroy 
        render json: {status: 'Success', message: 'Article deleted', data:article}, status: :ok
    end

    private 

    def article_params 
        params.require(:article).permit(:title, :text, :image, :category_id)
    end

end
