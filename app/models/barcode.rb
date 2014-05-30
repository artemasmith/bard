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
  resourcify
  validates :number, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :ware_id, numericality: true, presence: true
  belongs_to :ware
  has_many :client_code

  def to_xml_node document
  	bcode = Nokogiri::XML::Node.new 'barcode', document
    bcode[:number] = number
    bcode[:ware_id] = ware_id
    bcode
  end
end
