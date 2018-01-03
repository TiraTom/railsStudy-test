class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  mount_uploader :image, UserImageUploader
  
  has_many :tweets
  
  validates :name, length: {minimum: 8}, uniqueness: true 
  validates :email, uniqueness: true
  validates :password, length: {minimum: 6}, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :image, presence: true
  validates :profile, presence: true
  validate :picture_size

  private
  def picture_size
    if image.size > 500.kilobytes
      errors.add(:image, "は500KB以内のデータを選択してください")
    end
  end

end
