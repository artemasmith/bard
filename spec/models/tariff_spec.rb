# == Schema Information
#
# Table name: tariffs
#
#  id               :integer          not null, primary key
#  title            :string(255)
#  cost             :decimal(, )
#  shops_count      :integer
#  categories_count :integer
#  created_at       :datetime
#  updated_at       :datetime
#

require 'spec_helper'

describe Tariff do
  before(:all) do
    user = create(:user)
    tariff1 = create(:tariff, cost: 10.0, title: 'New vip', shops_count: 10)
    tariff2 = create(:tariff, cost: 1000.0, title: 'SuperVip')
    user.activities.create(amount_debet: 10.0)
  end

  it 'should change tariff to vip if has enough money' do
    user.update_tariff(tariff1.id)
    user.tariff.should eq(tariff1)
    user.balance.should eq(0.0)
    user.activities.last.amount_credit.should eq(tariff1.cost)
  end

  it 'should not change tariff when has no money' do
    user.update_tariff(tariff2)
    user.tariff.should_not eq(tariff2)
    user.activities.last.amount_credit.should_not eq(tariff2.cost)
    user.balance.should_not < 0
  end
end
