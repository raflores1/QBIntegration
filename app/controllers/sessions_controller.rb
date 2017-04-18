class SessionsController < ApplicationController

def oauth_callback
    auth = env["omniauth.auth"][:credentials]
    session[:token] = auth[:token] 
    session[:secret] = auth[:secret] 
    session[:realm_id] = params['realmId']
	# at = Marshal.load(session[:qb_request_token]).get_access_token(:oauth_verifier => params[:oauth_verifier])
	# session[:token] = at.token
	# session[:secret] = at.secret
	# session[:realm_id] = params['realmId']
  redirect_to root_url, notice: "Your Quickbooks Account has been succesfully linked"
	# store the token, secret & RealmID somewhere for this user, you will need all 3 to work with Quickbooks-Ruby
end



end
