require 'sidekiq/api'
class Post < ActiveRecord::Base

  belongs_to :materia
  belongs_to :fonte
  belongs_to :user

  mount_uploader :imagem, ImageUploader


  after_save :agendar
  before_destroy :remover_agendamento

  validates :legenda, :data_agendada, presence:true

  def posted_collection
    [:facebook, :twitter, :instagram, :app].select{|posted| self.send(posted)}.map{|posted| Post.human_attribute_name(posted)}.to_sentence
  end

  def agendar
    remover_agendamento if self.changed? && self.job_pid
    update_column(:job_pid, PostWorker.perform_at(data_agendada, self.id))
  end 

  def remover_agendamento
    Sidekiq::Status.cancel(self.job_pid) if self.job_pid
  end


end
  
