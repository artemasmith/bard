# == Schema Information
#
# Table name: barcodes
#
#  id         :integer          not null, primary key
#  number     :string(255)
#  ware_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class BarcodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
