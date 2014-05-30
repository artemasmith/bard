# == Schema Information
#
# Table name: unvalidated_wares
#
#  id         :integer          not null, primary key
#  barode     :string(255)
#  comment    :string(255)
#  client_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class UnvalidatedWare < ActiveRecord::Base
  resourcify
  belongs_to :client
end
