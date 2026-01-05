class PostsController < ApplicationController
  # before_action :authenticate_user!, only: [:create]

  def index
    render json: Post.all, each_serializer: nil
  end

  def create
    # @post = current_user.posts.build(post_params)
    @post = Post.new(post_params)
    @post.user = User.first

    if @post.save
      PublishPostJob.perform_later(@post.id)
      render json: @post.as_json, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :published)
  end
end
