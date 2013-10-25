require 'spec_helper'

describe Barcode do
    describe 'simple check' do
	it {should respond_to :number}
	it {should respond_to :id_ware}
    end
end
