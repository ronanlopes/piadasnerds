class User < ActiveRecord::Base


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable


  mount_uploader :avatar, AvatarUploader

  validates :email, :nome, presence: true


  def foto
    default_url = "http://pcdoctorti.com.br/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png"
    self.avatar.present? ? self.avatar.to_s : default_url
  end

end
