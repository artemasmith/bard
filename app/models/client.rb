# == Schema Information
#
# Table name: clients
#
#  id                     :integer          not null, primary key
#  title                  :string(255)
#  specs                  :text
#  login                  :string(255)
#  password               :string(255)
#  blocked                :boolean
#  created_at             :datetime
#  updated_at             :datetime
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
#

class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :unvalidated_ware
  has_many :client_codes
  has_many :shops, class_name: 'ClientShop', foreign_key: :client_id
  has_many :unvalidated_wares
end
