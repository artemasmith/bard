require 'spec_helper'

describe 'Barcodes api' do

  before do
    @client = FactoryGirl.create(:user)
    tariff = FactoryGirl.create(:tariff, shops_count: 2)
    @client.update(tariff_id: tariff.id)
    @client.shops.create()
    @shop = @client.shops.last
    @auth_token = @shop.auth_token
    category = FactoryGirl.create(:category)
    ware = FactoryGirl.create(:ware, category_id: category.id)
    #@client.shops.last.wares << ware
    FactoryGirl.create(:barcode, ware_id: ware.id, number: '123456') until Barcode.find_by_number('123456')
    v = FactoryGirl.create(:value)
    p = FactoryGirl.create(:property)
    FactoryGirl.create(:characteristic, ware_id: ware.id, property_id: p.id, value_id: v.id)
  end

  describe 'wrong authentication' do

    it 'no login' do
      get '/api/barcode', { login: @client.login, number: '123456' }, { "Accept" => "application/json" }
      expect(response.body).to include('no login or auth token')
    end

    it 'incorrect user login' do
      get '/api/barcode', {login: 'unreal_user', auth_token: @auth_token, barcodes: '123456'}, { "Accept" => "application/json" }
      expect(response.body).to include('wrong login')
    end

    it 'incorrect auth token or ip - no shop' do
      get '/api/barcode', {login: @client.login, auth_token: '12345678901234567890123456789012', barcodes: '123456' }, { "Accept" => "application/json" }
      expect(response.body).to include('no shop')
    end

    it 'token expired' do
      @client.shops.last.update(token_expire: Date.yesterday)
      get '/api/barcode', {login: @client.login, auth_token: @auth_token, barcodes: '123456'}, { "Accept" => "application/json" }
      expect(JSON(response.body)['error_message']).to eq('token_expire')
    end

    it 'shop disabled' do
      @client.shops.last.disabled!
      get '/api/barcode',{login: @client.login, auth_token: @auth_token, barcodes: '123456'}, { "Accept" => "application/json" }
      expect(response.body).to include('shop_disabled')
      @client.shops.last.normal!
    end


  end

  describe 'correct responce check ' do
    before do
      @client.shops.last.normal!
    end

    it 'should get barcodes' do
      get '/api/barcode', { login: @client.login, auth_token: @auth_token, barcodes: '123456' }, { "Accept" => "application/json" }
      expect(response.status).to eq 200
    end

    it 'should contain barcodes in json' do
      get '/api/barcode', { login: @client.login, auth_token: @auth_token, barcodes: '123456' }, { "Accept" => "application/json" }
      json = JSON(response.body)
      expect(json.count).to be > 0
    end

    it 'should contain categories ' do
      get '/api/barcode', { login: @client.login, auth_token: @auth_token, barcodes: '123456' }
      json = JSON(response.body)
      expect(json['categories'].count).to be > 0
    end

    it 'should contain properties ' do
      get '/api/barcode', { login: @client.login, auth_token: @auth_token, barcodes: '123456' }, { "Accept" => "application/json" }
      json = JSON(response.body)
      expect(json['properties'].count).to be > 0
    end

    it 'should contain values ' do
      get '/api/barcode', { login: @client.login, auth_token: @auth_token, barcodes: '123456' }, { "Accept" => "application/json" }
      json = JSON(response.body)
      expect(json['values'].count).to be > 0
    end
  end

  #Test INDEX action in barcodes controller
  context 'success get of wares' do

    it 'index action works fine' do
      get '/api/barcodes', { login: @client.login, auth_token: @auth_token, barcodes: '123456' }, { "Accept" => "application/json" }
      expect(response.status).to eq 200
    end

    it 'should return ware specs by barcode' do
      get '/api/barcode', { login: @client.login, auth_token: @auth_token, barcodes: '123456' }
      json = JSON(response.body)
      expect(json['wares'][0]['title']).to eq Barcode.find_by_number('123456').ware.title
    end

    it 'should return 2 wares by 2 known barcodes' do
      ware = FactoryGirl.create(:ware, title: 'Bulba')
      barcode = FactoryGirl.create(:barcode, number: '7890', ware_id: ware.id)
      get '/api/barcode', { login: @client.login, auth_token: @auth_token, barcodes: "123456,#{barcode.number}" }
      expect(JSON(response.body)['wares'].count).to eq 2
    end

    it 'should return unvalidated ware on unknown barcode' do
      get '/api/barcode', { login: @client.login, auth_token: @auth_token, barcodes: "123456,666666" }
      expect(JSON(response.body)['unrecognized_wares'].count).to be > 0
    end

    it 'get request should inc counters of shop wares' do
      w = FactoryGirl.create(:ware, title: 'New cool watermellon')
      FactoryGirl.create(:barcode, number: '341256', ware_id: w.id)
      get '/api/barcode', { login: @client.login, auth_token: @auth_token, barcodes: '341256' }
      expect(@shop.wares).to include(w)
    end

    describe 'return all shop wares if we lost data on client side' do
      before do
        w1 = FactoryGirl.create(:ware, title: 'orange')
        @shop.wares << w1
        w2 = FactoryGirl.create(:ware, title: 'banana')
        @shop.wares << w2
        w3 = FactoryGirl.create(:ware, title: 'lemon')
        @shop.wares << w3
        FactoryGirl.create(:barcode, ware_id: w1.id, number: '11112')
        FactoryGirl.create(:barcode, ware_id: w2.id, number: '123112')
        FactoryGirl.create(:barcode, ware_id: w3.id, number: '11134232')
      end
      it 'should return all shop wares on demand(restore request)' do
        get '/api/barcodes', { login: @client.login, auth_token: @auth_token }
        puts(response.body)
        expect(JSON(response.body)['wares'].count).to be >= 3
      end
    end

  end

  describe 'unvalidated wares request from client ' do
    it 'should create unvalidated wares' do

    end
  end


end