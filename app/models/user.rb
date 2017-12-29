class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  mount_uploader :image, UserImageUploader
  
  has_many :tweets
  
  validates :name, presence: true, length: {in: 1..8}
  validates :agreement, presence: true, acceptance: {accept: true}
  
end
