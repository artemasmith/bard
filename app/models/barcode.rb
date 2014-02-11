# == Schema Information
#
# Table name: barcodes
#
#  id         :integer          not null, primary key
#  number     :string(255)
#  id_ware    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Barcode < ActiveRecord::Base
  validates :number, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :id_ware, numericality: true, presence: true 
  belongs_to :ware
  has_many :client_code

  def xml_response
  	
  end
end