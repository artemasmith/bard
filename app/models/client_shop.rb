# == Schema Information
#
# Table name: client_shops
#
#  id           :integer          not null, primary key
#  ip           :string(255)
#  out_id       :integer
#  client_id    :integer
#  auth_token   :string(255)
#  token_expire :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

class ClientShop < ActiveRecord::Base
  belongs_to :client

  before_create :generate_token

  def generate_token
    self.auth_token = Digest::MD5.hexdigest("#{self.client_id} - #{Time.now}")
    self.token_expire = Date.today + 1.year
  end
end
 