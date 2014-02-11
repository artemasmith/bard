# == Schema Information
#
# Table name: characteristics
#
#  id         :integer          not null, primary key
#  id_ware    :integer
#  id_prop    :integer
#  id_val     :integer
#  id_ext     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Characteristic < ActiveRecord::Base
  belongs_to :ware
end
