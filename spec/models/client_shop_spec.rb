# == Schema Information
#
# Table name: client_shops
#
#  id           :integer          not null, primary key
#  ip           :string(255)
#  out_id       :integer
#  client_id    :integer
#  auth_token   :string(255)
#  token_expire :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe ClientShop do
  pending "add some examples to (or delete) #{__FILE__}"
end
