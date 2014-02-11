# == Schema Information
#
# Table name: unvalidated_wares
#
#  id         :integer          not null, primary key
#  barode     :string(255)
#  comment    :string(255)
#  id_client  :integer
#  created_at :datetime
#  updated_at :datetime
#

class UnvalidatedWare < ActiveRecord::Base
  belongs_to :client
end
