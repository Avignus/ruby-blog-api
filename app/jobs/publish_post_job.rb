class PublishPostJob < ApplicationJob
  queue_as :default

  def perform(post_id)
    post = Post.find(post_id)

    # Simulate slow work (email, social post, etc.)
    sleep 3 # 3s "processing"

    post.update(published: 1) # Use your integer enum
    puts "Post ##${post.id} published!"
  end
end
