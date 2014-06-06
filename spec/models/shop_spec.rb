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
#  created_at   :datetime
#  updated_at   :datetime
#  address      :string(255)
#  title        :string(255)
#  shop_type    :string(255)
#

require 'spec_helper'

describe Shop do
  pending "add some examples to (or delete) #{__FILE__}"
end
