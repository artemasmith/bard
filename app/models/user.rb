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
#  name                   :string(255)
#  login                  :string(255)
#  specs                  :text
#  tariff_id              :integer
#  created_at             :datetime
#  updated_at             :datetime
#  balance                :decimal(, )
#

class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :group, class_name: 'GroupUser'

  #has_and_belongs_to_many :roles, :join_table => :users_roles

  has_many :shops
  #has_and_belongs_to_many :wares
  has_and_belongs_to_many :categories
  has_many :unvalidated_wares
  has_many :activities
  belongs_to :tariff

  accepts_nested_attributes_for :tariff

  after_create :set_initial_tariff

  def get_name
    name || email
  end

  def update_tariff

  end

  protected

  def set_initial_tariff
    self.update(tariff: Tariff.find_by_title('Free')) if self.tariff.blank?
  end
end
