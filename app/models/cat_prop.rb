# == Schema Information
#
# Table name: cat_props
#
#  id         :integer          not null, primary key
#  id_cat     :integer
#  id_prop    :integer
#  created_at :datetime
#  updated_at :datetime
#

class CatProp < ActiveRecord::Base
end
