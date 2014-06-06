require 'spec_helper'

describe 'Shops' do

  context 'unauthenticated user' do
    it 'should redirect to login' do
      @client = User.create(:email => 'user@example.com', :password => 'password123')
      visit user_shops_path(@client)
      expect(page).to have_content 'Sign in'
    end
  end

  context 'authenticated user work with shops' do
    before(:each) do
      #WTF???? FACTORYGIRL NOT WORKING!!!
      #@client = FactoryGirl.create(:clients)
      #@client.shops.create(title: 'Test')
      @client = User.create(:email => 'user@example.com', :password => 'password123')
      @client.shops.create(title: 'Test')
      puts @client
      visit 'users/sign_in'
      fill_in 'user[email]', :with => @client.email
      fill_in 'user[password]', :with => @client.password
      click_button 'Sign in'
    end

    it 'should display shops' do
      puts @client
     # shop = FactoryGirl.create(:shops, client_id: @client.id)
      visit user_shops_path(@client)
      expect(page).to have_content "#{@client.shops.last.address}"
    end

  end

end