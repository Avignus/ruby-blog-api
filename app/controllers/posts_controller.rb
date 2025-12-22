class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    render json: Post.all
  end

  def create
    post = current_user.posts.build(post_params)
    if post.save
      render json: post, status: :created
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
