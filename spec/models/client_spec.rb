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

require 'spec_helper'

describe Client do
  pending "add some examples to (or delete) #{__FILE__}"
end
