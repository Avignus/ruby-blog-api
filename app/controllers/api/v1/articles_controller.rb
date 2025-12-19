module Api
  module V1
    class ArticlesController < ApplicationController
      # Disable auth for index, require it for create (see Security section below)
      skip_before_action :authenticate, only: [:index, :show]

      def index
        @articles = Article.published.order(created_at: :desc)
        render json: @articles, status: :ok
      end

      def show
        @article = Article.find(params[:id])
    		render json: @article, status: :ok
  			rescue ActiveRecord::RecordNotFound
    		render json: { error: "Article not found" }, status: :not_found
			end

			def create
        @article = Article.new(article_params)
        if @article.save
          render json: @article, status: :created
        else
          # 422 Unprocessable Entity is the standard error status
          render json: { errors: @article.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def article_params
        params.require(:article).permit(:title, :body, :published)
      end
    end
  end
end
