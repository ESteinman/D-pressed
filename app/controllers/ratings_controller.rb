class RatingsController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    def create
        article = Article.find(params[:article_id])
        rating = article.ratings.create(value: params[:rating].to_i, user: current_user)
        if rating.persisted?
            render json: { message: 'Thank you for your vote'}, status: :ok
        else
            render json: { error: 'An error occured'}, status: :unprocessable_entity
        end
    end
end
