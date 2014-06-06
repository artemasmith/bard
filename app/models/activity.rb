# == Schema Information
#
# Table name: activities
#
#  id                :integer          not null, primary key
#  amount_debet      :decimal(, )
#  amount_credit     :decimal(, )
#  payment_system_id :integer
#  state             :string(255)
#  user_id           :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class Activity < ActiveRecord::Base
  belongs_to :user
  before_save :set_amounts
  after_save :set_balance
  validates :user_id, presence: true

  protected

  def set_amounts
    amount_credit = 0.0 if amount_debet.blank?
    amount_debet = 0.0 if amount_debet.blank?
  end
  def set_balance
    balance = self.user.balance
    balance = balance + self.amount_debet - self.amount_credit
    self.user.update(balance: balance)
  end
end
