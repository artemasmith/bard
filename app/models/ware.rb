# == Schema Information
#
# Table name: wares
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  id_parent  :integer
#  specs      :text
#  id_cat     :integer
#  type       :integer
#  id_ext     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Ware < ActiveRecord::Base
  has_many :characteristic
  has_many :barcode
  has_and_belongs_to_many :children, join_table: 'groups_wares', class_name: 'Ware', foreign_key: 'id_parent', 
  	after_add: :update_id,
  	after_remove: :delete_id

  def parent
  	self.id_parent ? Ware.find(self.id_parent) : nil
  end

  protected

  def update_id child
  	child.update(id_parent: self.id)
  end
  def delete_id child
  	child.update(id_parent: nil)
  end

end
