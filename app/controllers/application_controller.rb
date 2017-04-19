class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  VERIFIER_TOKEN = ENV['VERIFIER_TOKEN']




  def verify_webhook(data, hmac_header)
    digest  = OpenSSL::Digest.new('sha256')
    calculated_hmac = Base64.encode64(OpenSSL::HMAC.digest(digest, VERIFIER_TOKEN, data)).strip
    calculated_hmac == hmac_header
  end
end
