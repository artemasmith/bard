# == Schema Information
#
# Table name: wares
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  parent_id   :integer
#  specs       :text
#  category_id :integer
#  ware_type   :integer
#  id_ext      :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Ware < ActiveRecord::Base
  has_many :characteristics
  belongs_to :category
  has_many :barcodes

  before_save :generate_ext_id

  def to_xml_node document
    node = Nokogiri::XML::Node.new 'ware', document
    node[:title] = title
    node[:specs] = specs
    node[:ware_type] = ware_type
    node[:id_ext] = id_ext
    node[:category_id] = category_id
    node
  end

  def generate_ext_id
    id_ext = Digest::MD5.hexdigest "Time.now + #{title}"
  end
end
