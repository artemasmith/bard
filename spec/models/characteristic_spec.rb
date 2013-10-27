require 'spec_helper'

describe Characteristic do
  describe 'var methods check' do
        it {should respond_to :id_ware}
        it {should respond_to :ip_prop}
        it {should respond_to :ip_val}
        it {should respond_to :ip_ext}
    end
end


