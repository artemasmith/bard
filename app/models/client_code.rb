# == Schema Information
#
# Table name: client_codes
#
#  id         :integer          not null, primary key
#  id_client  :integer
#  id_barcode :integer
#  created_at :datetime
#  updated_at :datetime
#

class ClientCode < ActiveRecord::Base
  belongs_to :client
  belongs_to :barcode
end
