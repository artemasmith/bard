require 'spec_helper'

describe CatProp do
    describe 'var methods check' do
	it {should respond_to :id_cat}
	it {should respond_to :id_prop}
    end
end
