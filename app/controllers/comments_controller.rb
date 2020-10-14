class CommentsController < ApplicationController
    
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end
    
    def destroy
        if current_user.has_role?(:editor)
            @article = Article.find(params[:article_id])
            @comment = @article.comments.find(params[:id])
            @comment.destroy
            redirect_to article_path(@article)
        else 
            @article = Article.find(params[:article_id])
            @comment = @article.comments.find(params[:id])
            @comment.destroy
            redirect_to article_path(@article)
        end
    end
    
    private def comment_params
        params.require(:comment).permit(:body, :commenter)
    end  

end
