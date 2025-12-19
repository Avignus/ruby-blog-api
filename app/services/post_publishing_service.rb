class PostPublishingService
  def initialize(post)
    @post = post
  end

  def call
    return false unless @post.valid?
    @post.update!(published: true)
    @post #Add mailer later
  end
end
