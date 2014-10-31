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
#  balance                :decimal(, )      default(0.0)
#  role                   :integer          default(2)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :shops
  #has_and_belongs_to_many :wares
  has_and_belongs_to_many :categories

  has_many :activities
  belongs_to :tariff

  accepts_nested_attributes_for :tariff

  before_create :set_default_role
  after_create :set_initial_tariff

  enum role: [:admin, :manager, :client]

  def get_name
    return self.name if self.name.present?
    self.email
  end

  def update_tariff(tariff_id)
    tariff = Tariff.find(tariff_id)
    if self.balance >= tariff.cost
      self.update(tariff_id: tariff.id)
      self.activities.create(amount_credit: tariff.cost)
      return 'tariff changed'
    else
      self.errors.add(:tariff_id, 'not enough money for operation')
      return 'not enough money'
    end
  end


  private

  def set_default_role
    self.role ||= :client
  end
  def set_initial_tariff
    self.update(tariff: Tariff.find_by_title('Free')) if self.tariff.blank?
  end
end
