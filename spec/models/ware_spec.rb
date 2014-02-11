# == Schema Information
#
# Table name: wares
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  id_parent  :integer
#  specs      :text
#  id_cat     :integer
#  type       :integer
#  id_ext     :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Ware do
    describe "check methods and vars" do
	it {should respod_to :title}
	it {should respod_to :id_parent}
	it {should respod_to :specs}
	it {should respod_to :id_cat}
	it {should respod_to :type}
	it {should respod_to :id_ext}
	#methods
	it {should respod_to :get_ware}
	it {should respod_to :add_ware}
    end
end
