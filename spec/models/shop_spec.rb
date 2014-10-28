# == Schema Information
#
# Table name: shops
#
#  id           :integer          not null, primary key
#  ip           :string(255)
#  out_id       :integer
#  user_id      :integer
#  auth_token   :string(255)
#  token_expire :datetime
#  address      :string(255)
#  shop_type    :string(255)
#  title        :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  state        :integer          default(0)
#

require 'spec_helper'

describe Shop do
  context 'wrong shop creation' do
    it 'should not add shop to user with limit in tariff' do
      user = FactoryGirl.create(:user)
      puts "user = #{user}"
      user.update(tariff: FactoryGirl.create(:tariff))
      puts "tariff= #{user.tariff}"
      user.shops.create
      puts "shops1 = #{user.shops.last}"
      expect{ user.shops.create }.not_to change{ Shop.count }
    end
  end
end
