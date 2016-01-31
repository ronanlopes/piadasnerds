class TwitterWorker
  include Sidekiq::Worker
  
  def perform(post_id)
    post = Post.find(post_id)
    $twitter.update(post.legenda)
  end
end