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
#  state       :integer          default(0)
#  created_at  :datetime
#  updated_at  :datetime
#  alcohol     :boolean          default(FALSE)
#  producer_id :integer
#  capacity    :decimal(, )
#  strength    :decimal(, )
#

class Ware < ActiveRecord::Base
  has_many :characteristics
  belongs_to :category
  has_many :barcodes
  #has_and_belongs_to_many :users
  has_and_belongs_to_many :shops
  belongs_to :parent, class_name: 'Ware', foreign_key: :parent_id
  has_many :children, class_name: 'Ware', foreign_key: :parent_id

  before_save :generate_ext_id, :set_state


  enum state: [:created, :published, :moderated, :archived]

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

  def set_state
    self.state ||= :created
  end
end
