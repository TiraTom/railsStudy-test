class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  mount_uploader :image, UserImageUploader
  
  has_many :tweets
  
  validates :name, length: {minimum: 8}, uniqueness: true 
  validates :email, uniqueness: true
  validates :password, length: {minimum: 6}
  validates :password_confirmation, presence: true
  validates :image, presence: true
  validates :profile, presence: true

end
