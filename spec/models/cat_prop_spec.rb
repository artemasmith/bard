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

require 'spec_helper'

describe CatProp do
    describe 'var methods check' do
	it {should respond_to :id_cat}
	it {should respond_to :id_prop}
    end
end
