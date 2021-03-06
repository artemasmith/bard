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

require 'spec_helper'

describe Barcode do
  describe 'simple check' do
    it { should respond_to :number }
    it { should respond_to :ware_id }

    describe 'right and wrong creation' do
      let(:barcode) { Barcode.new(number: '254321223', ware_id: 1) }
      let(:wrong_barcode) { Barcode.new(number: '254321223', ware_id: "ddfdfd") }
      let(:wrong_barcode2) { Barcode.new(ware_id: 1) }
     
      it 'save right barcode' do
      	expect{ barcode.save }.to change{ Barcode.count }.by(1)
      end

      describe 'wrong save' do
        it { expect{ wrong_barcode.save }.not_to change{ Barcode.count } }
        it { expect{ wrong_barcode2.save }.not_to change{ Barcode.count } }
      end
    end
  end
end
