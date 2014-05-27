# == Schema Information
#
# Table name: barcodes
#
#  id         :integer          not null, primary key
#  number     :string(255)
#  ware_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Barcode < ActiveRecord::Base
  validates :number, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :ware_id, numericality: true, presence: true
  belongs_to :ware
  has_many :client_code

  def xml_response
  	
  end
end
