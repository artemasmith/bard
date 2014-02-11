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

  #return xml
  def xml_response
  	xml = {}
  	#GROUPS
  	groups = {}
  	if self.ware.parent
  	  parentware = self.ware.parent
  	  i=0
  	  while parentware 
  	  	groups["group#{i}"] = { id_ext: parentware[:id_ext], title: parentware[:title], id_parent: parentware[:id_parent] }
  	  	parentware = parentware.parent
  	  	i++
  	  end
	end
	xml[:group] = groups

	xml.to_xml
  end
end