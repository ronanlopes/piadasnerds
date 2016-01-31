class Post < ActiveRecord::Base

  belongs_to :materia
  belongs_to :fonte
  belongs_to :user

  after_save :agendar


  def posted_collection
    #[:facebook, :twitter, :instagram, :app].select{|posted| post.send(posted)}.map{|posted| human_attribute_name(posted)}
    "Facebook e Instagram"
  end

  def agendar
    logger.debug 2222222222222222222222222222
    logger.debug data_agendada
    if self.twitter
      TwitterWorker.perform_at(data_agendada, self.id)
    end
  end 


end
  
