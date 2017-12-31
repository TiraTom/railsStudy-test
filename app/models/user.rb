class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  mount_uploader :image, UserImageUploader
  
  has_many :tweets
  
  validates :name, length: {in: 1..8}
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
  validates :image, presence: true
  validates :profile, presence: true

end
