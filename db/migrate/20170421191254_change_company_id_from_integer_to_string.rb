class ChangeCompanyIdFromIntegerToString < ActiveRecord::Migration[5.0]
  def change
    change_column :tenants, :company_id, :string
  end
end
