require 'spec_helper'

describe 'Authentication API' do
  it 'authenticate and get token' do
     client = FactoryGirl.create(:client)
     post "/api/auth", { login: client.login, password: client.password }, { "Accept" => "application/xml" }
     #post create_session_url(login: client.login, password: client.password)
     puts "client #{client}"
     
     expect(response).to be_success
     xml = Nokogiri::XML(response.body)
     puts "xml: #{xml}"
     expect xml.xpath(/auth_token/).length > 0
  end

end