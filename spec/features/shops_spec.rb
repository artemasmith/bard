require 'spec_helper'

describe 'Shops' do

  context 'unauthenticated user' do
    it 'should redirect to login' do
      @client = User.create(:email => 'user@example.com', :password => 'password123')
      visit user_shops_path(@client)
      expect(page).to have_content 'Sign in'
    end
  end

  context 'user cant create more then tariff max shops' do
    before(:each) do
      user1 = FactoryGirl.create(:user)
      visit 'users/sign_in'
      fill_in 'user[email]', :with => user2.email
      fill_in 'user[password]', :with => user2.password
      click_button 'Sign in'
    end

    it 'user2 cant delete shop of user1' do
      visit new_user_shops_path(user_id: user1.id)
      click_link 'Удалить'
    end
  end

  context 'authenticated user work with shops' do
    before(:each) do
      #WTF???? FACTORYGIRL NOT WORKING!!!
      @client = FactoryGirl.create(:user)
      #@client.shops.create(title: 'Test')
      #@client = User.create(:email => 'user@example.com', :password => 'password123')
      @client.shops.create(title: 'Test')
      puts @client
      visit 'users/sign_in'
      fill_in 'user[email]', :with => @client.email
      fill_in 'user[password]', :with => @client.password
      click_button 'Sign in'
    end

    it 'should display shops' do
      puts "client= #{@client}"
     # shop = FactoryGirl.create(:shops, client_id: @client.id)
      visit user_shops_path(@client)
      expect(page).to have_content "#{@client.shops.last.address}"
    end

    it 'should display show wares button' do
      visit user_shops_path(@client)
      expect(page).to have_link "Товары"
    end

    it 'should display show wares button' do
      visit user_shops_path(@client)
      expect(page).to have_link "Удалить"
    end

    it 'should display show wares button' do
      visit user_shops_path(@client)
      expect(page).to have_link "Редактировать"
    end

    it 'should display show wares button' do
      visit user_shops_path(@client)
      expect(page).to have_link "Показать"
    end

  end

end