# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  specs      :text
#  login      :string(255)
#  pass       :string(255)
#  blocked    :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Client < ActiveRecord::Base
  has_many :unvalidated_ware
  has_many :client_code
end
