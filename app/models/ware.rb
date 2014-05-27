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
end
