# == Schema Information
#
# Table name: client_codes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  barcode_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class ClientCode < ActiveRecord::Base
  belongs_to :user
  belongs_to :barcode
end
