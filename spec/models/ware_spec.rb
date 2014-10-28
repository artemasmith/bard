# == Schema Information
#
# Table name: wares
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  parent_id   :integer
#  specs       :text
#  category_id :integer
#  ware_type   :integer
#  id_ext      :integer
#  state       :integer          default(0)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Ware do
    describe "check bindings to shop" do
      before do
        @user = FactoryGirl.create(:user)
        tariff = FactoryGirl.create(:tariff)
        @user.update(tariff: tariff)
        @user.shops.create
        @ware = FactoryGirl.create(:ware)
        @user.shops.last.wares << @ware
        #user.shops.last.wares.create()
      end
      it "check binding between shop and ware" do
        expect(@user.shops.last.wares.last).to eq @ware
      end
    end

    describe 'check my state machine' do
      before do
        @ware = FactoryGirl.create(:ware)
      end
      it { expect(@ware.state).to eq("created") }
    end
end
