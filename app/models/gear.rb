class Gear < ApplicationRecord
  validates :name, {presence:true}
  validates :user_id, {presence:true}
  
  def user
    return User.find_by(id: self.user_id)
  end
  
  # def gears
  #   return Gear.where(user_id: self.id)
  # end
end