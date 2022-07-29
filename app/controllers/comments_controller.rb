class CommentsController < ApplicationController  
    http_basic_authenticate_with name: "khushi", password: "secret", only: :destroy  
    def new
        @article = Article.find(params[:article_id])
        @comment = @article.comments.new
    end
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comments_params)
        redirect_to article_path (params[:article_id]) 
    end
    def edit
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
    end    
    def update
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        if @comment.update(comments_params)
            redirect_to (@article)
          else
            redirect_to (@article)
          end 
        
    end    
    private
    def comments_params
        params.require(:comment).permit(:body,:commenter,:status)
    end 
    
end
