require 'spec_helper'

describe Categorie do
   describe 'var methods check' do
        it {should respond_to :title}
        it {should respond_to :id_ext}
    end

end
