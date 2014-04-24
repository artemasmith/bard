class ClientAuthController < ApplicationController
  def get_token    
    client = Client.where(login: params[:login], pass: params[:pass])[0]
    if client
      shop = client.shops.create(ip: request.remote_ip, out_id: params[:out_id], auth_token: Digest::MD5.hexdigest("#{ client.id }+#{ Time.now }"), token_expire: Time.now + 5.days)
      #@token = 
      respond_to do |format|
        if shop
          format.xml { render :xml => Nokogiri::XML("<response><client>#{ shop.id }</client><auth_token>#{ shop.auth_token }</auth_token></response>") }
        else
          format.xml { render :xml => Nokogiri::XML("<error> #{ shop.errors.messages }</error>") }
        end
      end
    else
      render :xml => Nokogiri::XML("<error> Can't find client with this credentials. Check your login and password. </error>")
    end
  end

  def update_token
  end
  

end
