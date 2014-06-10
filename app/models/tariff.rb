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

class Tariff < ActiveRecord::Base
  has_many :users
end
