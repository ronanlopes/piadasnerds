class PostWorker
  include Sidekiq::Worker
  
  def perform(post_id)
    post = Post.find(post_id)
    if post.twitter
      post.imagem.to_s == "" ? $twitter.update(post.legenda) : $twitter.update_with_media(post.legenda, File.new(Rails.public_path.to_s+post.imagem.to_s))
    end
  end
end