# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  user_type              :integer
#  id_role                :integer
#  name                   :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  login                  :integer
#  specs                  :text
#

class Client < User
  #FOR ROLIFY
  self.adapter = User.adapter

  has_many :unvalidated_ware
  has_many :client_codes
  has_many :shops, class_name: 'ClientShop', foreign_key: :client_id
  has_many :unvalidated_wares

  after_create :set_role

  def self.render_error msg
    xml = Nokogiri::XML ''
    errors = Nokogiri::XML::Node.new 'errors', xml
    errors.content = msg
    xml.add_child(errors)
    xml
  end
  protected

  def set_role
    self.add_role :client
  end
end
