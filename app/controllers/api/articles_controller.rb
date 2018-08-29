class Api::ArticlesController < ApiController
  before_action :authenticate_api_user!, only: [:show]
  def index
    articles = Article.all  
    render json: articles
  end

  def show
    article = Article.find(params[:id])
    # user = article.user
    # image_url = rails_blob_path(article.image)
    render json: article, serializer: ArticlesSerializer
  end
end
