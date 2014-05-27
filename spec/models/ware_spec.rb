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
    describe "check methods and vars" do

    end
end
