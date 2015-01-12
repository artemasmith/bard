# == Schema Information
#
# Table name: alcohol_makers
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  inn            :string(255)
#  kpp            :string(255)
#  importer       :boolean
#  license        :string(255)
#  license_expire :date
#  region         :integer
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe AlcoholMaker do
  pending "add some examples to (or delete) #{__FILE__}"
end
