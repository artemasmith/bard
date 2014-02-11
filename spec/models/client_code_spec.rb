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

require 'spec_helper'

describe ClientCode do
  describe 'var methods check' do
        it {should respond_to :id_client}
        it {should respond_to :ip_barcode}
    end
end
