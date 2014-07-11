# == Schema Information
#
# Table name: shops
#
#  id           :integer          not null, primary key
#  ip           :string(255)
#  out_id       :integer
#  user_id      :integer
#  auth_token   :string(255)
#  token_expire :datetime
#  created_at   :datetime
#  updated_at   :datetime
#  address      :string(255)
#  title        :string(255)
#  shop_type    :string(255)
#

class Shop < ActiveRecord::Base
  #TODO Fucking rolify! Delete users role field or vanish rolify from Gemfile!
  resourcify
  belongs_to :user
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :wares

  before_create :generate_token
  validate :check_user_tariff

  def generate_token
    self.auth_token = Digest::MD5.hexdigest("#{self.user_id} - #{Time.now}")
    self.token_expire = Date.today + 1.year
  end

  def check_user_tariff
    if self.user.tariff.shops_count == self.user.shops.count
      errors.add(:user_id, "Too many shops in this tariff")
    end
  end
end
 
