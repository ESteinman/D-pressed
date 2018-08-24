class CommentsController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    def create
        article = Article.find(params[:article_id])
        comment = Comment.create(content: params[:comment], article: article, user: current_user)
        if comment.persisted?
        redirect_to article_path(article), notice: "Your comment was added successfully"
        end
    end
end
