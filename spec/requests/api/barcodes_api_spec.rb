require 'spec_helper'

describe 'Barcodes api' do
  #let(:client){ FactoryGirl.create(:client) }
  #let(:auth_key){ client.shops.create() }


  it 'should get barcodes' do
    @client = FactoryGirl.create(:client)
    @client.shops.create()
    @auth_token = @client.shops.last.auth_token
    get '/api/barcode', { login: @client.login, auth_token: @auth_token, number: '123456' }, { "Accept" => "application/xml" }
    puts response.body
    expect(response.status).to eq 200

  end
end