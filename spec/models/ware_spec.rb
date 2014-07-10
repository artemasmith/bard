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
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Ware do
    describe "check bindings to shop" do
      it "check binding between shop and ware" do
        user = FactoryGirl.create(:user)
        tariff = FactoryGirl.create(:tariff)
        user.update(tariff: tariff)
        user.shops.create
        ware = FactoryGirl.create(:ware)
        user.shops.last.wares << ware
        #user.shops.last.wares.create()

        expect(user.shops.last.wares.last).to eq ware
      end
    end
end
