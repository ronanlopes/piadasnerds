class Post < ActiveRecord::Base

  belongs_to :materia
  belongs_to :fonte
  belongs_to :user

  mount_uploader :imagem, ImageUploader

  validates :legenda, :data_agendada, presence:true

  def posted_collection
    [:facebook, :twitter, :instagram, :app].select{|posted| self.send(posted)}.map{|posted| Post.human_attribute_name(posted)}.to_sentence
  end


end
  
