json.extract! tenant, :id, :name, :token, :token_secret, :company_id, :created_at, :updated_at
json.url tenant_url(tenant, format: :json)
