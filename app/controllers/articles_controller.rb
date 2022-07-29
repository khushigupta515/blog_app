class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "khushi", password: "secret", except: [:index, :show]
  def index
    @articles = Article.all
  end  
  # id as a parameter in the route
  def show 
    @article = Article.find(params[:id])
  end
  def new
    @article = Article.new
  end  
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to (@article)
    else
      render "new"
    end  
  end 
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to (@article)
    else
      render "show"
    end  
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    # raise "This is an exception" 
    # flash[:success] = "The item was successfully destroyed."
    # redirect_to root_path, status: :see_other
  end
  private
  def article_params
    params.require(:article).permit(:title,:body,:status)
  end  


end
