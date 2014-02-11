# == Schema Information
#
# Table name: wares
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  id_parent  :integer
#  specs      :text
#  id_cat     :integer
#  type       :integer
#  id_ext     :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Ware do

    context 'creation' do
      let (:ware){ Ware.new(title: 'test', specs: 'test') }
      it { expect { ware.save }.to change { Ware.count }.by(1) }
    end

    context 'children check' do
      let(:parent){ Ware.create(title: 'parent', specs: 'parent ware') }
      let(:child1){ Ware.create(title: 'child1', specs: 'child ware') }
      let(:child2){ Ware.create(title: 'child2', specs: 'child ware') }
      before (:all) do
      	parent.children << child1
      end
      it { parent.children.count.should eq 1 } 
      it { expect { parent.children << child2 }.to change { parent.children.count }.by(1) }
      it { parent.children[0].should eq child1}
      it { child1.parent.should eq parent }
    end
end
