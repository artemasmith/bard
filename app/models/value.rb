# == Schema Information
#
# Table name: values
#
#  id         :integer          not null, primary key
#  id_prop    :integer
#  value      :string(255)
#  id_ext     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Value < ActiveRecord::Base
  belongs_to :property
end
