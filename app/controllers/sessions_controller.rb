class SessionsController < ApplicationController

def oauth_callback
    auth = request.env["omniauth.auth"][:credentials]
    tenant = Tenant.first
    tenant.token = auth[:token]
    tenant.token_secret = auth[:secret]
    tenant.company_id = params['realmId']
    tenant.save
    # session[:token] = auth[:token] 
    # session[:secret] = auth[:secret] 
    # session[:realm_id] = params['realmId']
  redirect_to root_url, notice: "Your Quickbooks Account has been succesfully linked"
	# store the token, secret & RealmID somewhere for this user, you will need all 3 to work with Quickbooks-Ruby
end



end
