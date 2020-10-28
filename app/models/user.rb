class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :username, presence: true
  validates :image_id, presence: true
  
  
  has_many :posts, :dependent => :destroy #ユーザー削除時投稿も削除
  has_many :gears, :dependent => :destroy
  has_many :likes, :dependent => :destroy
end
