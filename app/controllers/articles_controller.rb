class ArticlesController < ApplicationController
  # 액션이 시작하기 전에 먼저 실행해라
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    # @article.title = params[:title]
    # @article.content = params[:content]
    @article.save
    redirect_to articles_url(@article.id)
    # redirect_to @article
    
  end
  
  def show
  end

  def index
    @articles = Article.all
  end

  def edit
  end
  
  def update
    @article.update(article_params)
    redirect_to @article
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end
  
  # 하나의 article를 설정해라
  private
    def set_article
      @article = Article.find(params[:id])
    end
    
    def article_params
      params.require(:article).permit(:title, :content)
    end
end
