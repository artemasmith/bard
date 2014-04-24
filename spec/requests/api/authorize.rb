require 'spec_helper'

describe 'Authentication API' do
  it 'authenticate and get token' do
     FactoryGirl.create(:client)
     get "client_auth/&login=#{client.login}?pass=#{client.pass}"
     puts "client #{client}"
     
     expect(response).to be_success
     xml = Nokogiri::XML.new(response.body)
     expect xml.xpath(/auth_token/).length > 0
  end

end