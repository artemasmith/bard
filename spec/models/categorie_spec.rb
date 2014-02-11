# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  id_ext     :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Categorie do
   describe 'var methods check' do
        it {should respond_to :title}
        it {should respond_to :id_ext}
    end

end
