class Supplier < ApplicationRecord
    belongs_to :tenant
    
    after_create :qbo_create_vendor

    def qbo_create_vendor
        qbo = QboApi.new(consumer_key: CONSUMER_KEY, 
                      consumer_secret: CONSUMER_SECRET, 
                      token: self.tenant.token, 
                      token_secret: self.tenant.token_secret, 
                      realm_id: self.tenant.company_id)
    vendor = {  "PrimaryPhone": {
                                "FreeFormNumber": self.phone
                              },
              "PrimaryEmailAddr": 
                                {
                                "Address": self.email
                                },
              "WebAddr":        { 
                                "URI": self.website
                              },
                "DisplayName": self.name,
                "CompanyName": self.name
    }
    response = qbo.create(:vendor, payload: vendor)
    self.update(qbo_id: response['Id'])
    end

end
