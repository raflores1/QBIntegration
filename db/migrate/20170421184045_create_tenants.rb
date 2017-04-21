class CreateTenants < ActiveRecord::Migration[5.0]
  def change
    create_table :tenants do |t|
      t.string :name
      t.string :token
      t.string :token_secret
      t.integer :company_id

      t.timestamps
    end
  end
end
