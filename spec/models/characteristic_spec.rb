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

require 'spec_helper'

describe Characteristic do
  describe 'var methods check' do
        it {should respond_to :id_ware}
        it {should respond_to :ip_prop}
        it {should respond_to :ip_val}
        it {should respond_to :ip_ext}
    end
end


