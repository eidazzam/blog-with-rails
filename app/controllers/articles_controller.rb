class ArticlesController < ApplicationController
  before_action :set_article,only: [:show, :edit, :update, :destroy]
  # before_action :set_article, only: %i[ show edit update destroy ]
  
  
  def new 
        @article = Article.new
    end

    def index
        @articles = Article.all
      end
      
    def show   
      
    end
    
    def create
      @article = Article.new(article_params)
      
      if @article.save
        redirect_to :action => 'index'
      else
        render :new, status: :unprocessable_entity
    end
  end

  def edit
    
  end
  
  def update
   
    if @article.update(article_params)
      redirect_to :action => 'index'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    
     @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: "acticle was successfully destroyed." }
    end
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
  
  private
  def set_article
    @article = Article.find(params[:id] )
  end
  
  
  
end
