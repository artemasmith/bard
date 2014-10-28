# == Schema Information
#
# Table name: unvalidated_wares
#
#  id         :integer          not null, primary key
#  barcode    :string(255)
#  title      :string(255)
#  comment    :text
#  shop_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe UnvalidatedWare do
  describe 'Validate ware should delete item from table and create ware and barcode' do
    before do
      tariff = FactoryGirl.create(:tariff, shops_count: 2, cost: 1, categories: 100)
      user = FactoryGirl.create(:user, tariff_id: tariff.id)
      uware1 = FactoryGirl.create(:unvalidated_ware, barcode: '123', title: 'melon', comment:'very juicy', user_id: user.id)
      uware2 = FactoryGirl.create(:unvalidated_ware, barcode: '3456', title: 'orange',  comment:'like the sun', user_id: user.id)
      uware3 = FactoryGirl.create(:unvalidated_ware, barcode: '78912', title: 'potato',  comment: 'lukashenko likes', user_id: user.id)
    end

    it 'validates should create real ware' do
      bc = uware1.barcode
      uware1.validate_ware.should change{ Ware.count }.by(1)
      Ware.last.barcodes.map{ |b| b.number.to_s }.should include(bc)
    end

    it 'validates should delete self from uwares' do
      uware2.validate_ware.should change{ UnvalidatedWare.count }.by(-1)
    end

    it 'validates should create barcode if new' do
      bc = uware1.barcode
      uware3.validate_ware.should change{ Barcode.count }.by(1)
      Barcode.find_by_number(bc).should_not be_blank
    end

  end
end
