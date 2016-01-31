class Fonte < ActiveRecord::Base

  validates :nome, :url, presence: true

end
