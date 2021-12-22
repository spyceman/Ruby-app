class PostWorker
  include Sidekiq::Worker

  def perform(*args)
    @post = Post.new(params.require(:post).permit(:title, :body, :created_by))
    @post.save
  end
end
