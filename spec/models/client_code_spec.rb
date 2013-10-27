require 'spec_helper'

describe ClientCode do
  describe 'var methods check' do
        it {should respond_to :id_client}
        it {should respond_to :ip_barcode}
    end
end
