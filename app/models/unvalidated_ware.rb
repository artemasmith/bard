# == Schema Information
#
# Table name: unvalidated_wares
#
#  id         :integer          not null, primary key
#  barcode    :string(255)
#  comment    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#

class UnvalidatedWare < ActiveRecord::Base
  belongs_to :user
  validate :barcode, presence: true
  validate :comment, presence: true

  def validate

  end
end
