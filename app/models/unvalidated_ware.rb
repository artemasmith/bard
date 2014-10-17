# == Schema Information
#
# Table name: unvalidated_wares
#
#  id         :integer          not null, primary key
#  barcode    :string(255)
#  title      :string(255)
#  comment    :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class UnvalidatedWare < ActiveRecord::Base
  belongs_to :user
  validates :barcode, :comment, :title, presence: true

  #do I need this validation method?????
  def validate_ware
    barcode = Barcode.find_by_number(self.barcode)
    Ware.create(title: self.title, spec: self.comment)
  end
end
