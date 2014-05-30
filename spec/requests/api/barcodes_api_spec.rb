require 'spec_helper'

describe 'Barcodes api' do

  before(:each) do
    @client = FactoryGirl.create(:clients)
    @client.shops.create()
    @auth_token = @client.shops.last.auth_token
    ware = FactoryGirl.create(:ware)
    FactoryGirl.create(:barcode, ware_id: ware.id) until Barcode.find_by_number('123456')
    FactoryGirl.create(:value)
    FactoryGirl.create(:property)
    FactoryGirl.create(:characteristic, ware_id: ware.id)
  end

  it 'should get barcodes' do
    #@clients = FactoryGirl.create(:clients)
    #@clients.shops.create()
    #@auth_token = @clients.shops.last.auth_token
    # puts "clients = #{@clients}"
    # puts "auth_token = #{@auth_token}"
    # puts "barcode = #{Barcode.find_by_number('123456')}"
    # puts "char_ID = #{Barcode.last.ware.characteristics.last}"
    get '/api/barcode', { login: @client.login, auth_token: @auth_token, number: '123456' }, { "Accept" => "application/xml" }
    #puts response.body
    expect(response.status).to eq 200
  end

  it 'should contain barcodes in xml' do
    get '/api/barcode', { login: @client.login, auth_token: @auth_token, number: '123456' }, { "Accept" => "application/xml" }
    xml = Nokogiri::XML(response.body)
    #barcodes = xml.xpath('//barcodes').chi
    #puts "Barcodes children:"
    # puts xml.xpath('//barcodes').children
    # xml.xpath('//barcodes').children.each { |child| puts "child = #{child}" }
    # puts 'children count'
    # puts xml.xpath('//barcodes').children.count
    expect(xml.xpath('//barcodes').children.count).to be > 0

  end

  it 'should contain categories in xml' do
    get '/api/barcode', { login: @client.login, auth_token: @auth_token, number: '123456' }, { "Accept" => "application/xml" }
    xml = Nokogiri::XML(response.body)
    expect(xml.xpath('//categories').children.count).to be > 0
  end

  it 'should contain properties in xml' do
    get '/api/barcode', { login: @client.login, auth_token: @auth_token, number: '123456' }, { "Accept" => "application/xml" }
    xml = Nokogiri::XML(response.body)
    expect(xml.xpath('//properties').children.count).to be > 0
  end

  it 'should contain values in xml' do
    get '/api/barcode', { login: @client.login, auth_token: @auth_token, number: '123456' }, { "Accept" => "application/xml" }
    xml = Nokogiri::XML(response.body)
    expect(xml.xpath('//values').children.count).to be > 0
  end

  context 'authentication' do
    #AUTHENTICATION
    it 'should raise error due to authentication' do
      get '/api/barcode', { login: 'vaska@vs.ru', auth_token: @auth_token, number: '123456' }, { "Accept" => "application/xml" }
      #puts response.body
      expect(response.status).to eq 401
    end

    it 'should raise error due wrong barcode number' do
      get '/api/barcode', { login: @client.login, auth_token: @auth_token, number: '11111111111' }, { "Accept" => "application/xml" }
      #puts response.body
      expect(response.status).to eq 400
    end
  end

  #Test INDEX action in barcodes controller
  context 'index action' do

    it 'index action works fine' do
      get '/api/barcodes', { login: @client.login, auth_token: @auth_token, number: '123456' }, { "Accept" => "application/xml" }
      expect(response.status).to eq 200
    end

    it 'should return all clients shops category wares' do
      cat = FactoryGirl.create :category
      @client.shops.last.categories << cat
      ware = FactoryGirl.create :ware, category_id: cat.id
      get '/api/barcodes', { login: @client.login, auth_token: @auth_token, number: '123456' }, { "Accept" => "application/xml" }
      xml = Nokogiri::XML response.body
      xware = ''
      xml.xpath('//wares').children.each { |c| xware = c unless c.blank?}
      expect(xware[:title]).to eq ware.title
    end
  end

end