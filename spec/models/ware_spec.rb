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
