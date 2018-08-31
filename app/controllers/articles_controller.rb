class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :load_categories, only: [:index, :show, :new, :create]
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    authorize @article
  end
  
  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = current_user.articles.create(article_params)
    if @article.persisted?
      redirect_to root_path, notice: t('article_successfully_created.')
    else
      flash[:error] = t('empty_field')
      render :new
    end
  end
  
  private

  def article_params
    params.require(:article).permit(:title, :body, :image, :category_id)
  end

end
