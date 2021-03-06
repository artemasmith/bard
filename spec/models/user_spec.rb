# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  user_type              :integer
#  name                   :string(255)
#  login                  :string(255)
#  specs                  :text
#  tariff_id              :integer
#  created_at             :datetime
#  updated_at             :datetime
#  balance                :decimal(, )      default(0.0)
#  role                   :integer          default(2)
#

require 'spec_helper'

describe User do
  describe 'after creation tariff is setted properly' do
    it 'new user - tariff free' do
      user = create(:user)
      user.tariff.last.title.should eq 'Free'
    end

  end
end
