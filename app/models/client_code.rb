# == Schema Information
#
# Table name: client_codes
#
#  id         :integer          not null, primary key
#  client_id  :integer
#  barcode_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class ClientCode < ActiveRecord::Base
  resourcify
  belongs_to :client
  belongs_to :barcode
end
