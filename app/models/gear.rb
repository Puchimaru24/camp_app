class Gear < ApplicationRecord
  validates :name, {presence:true}
  validates :category, {presence:true}
  validates :user_id, {presence:true}
  
  # ActiveRecord
  has_one_attached :image
  
  belongs_to :user
  # def user
  #   return User.find_by(id: self.user_id)
  # end
  
end