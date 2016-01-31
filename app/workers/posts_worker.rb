class PostsWorker
  include Sidekiq::Worker
  
  def perform
    $twitter.update("Agendado para 14:06!")
  end
end