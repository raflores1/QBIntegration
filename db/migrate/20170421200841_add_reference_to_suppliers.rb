class AddReferenceToSuppliers < ActiveRecord::Migration[5.0]
  def change
    add_reference :suppliers, :tenant, foreign_key: true
  end
end
