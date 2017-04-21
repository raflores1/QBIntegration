class AddQboIDtoSupplier < ActiveRecord::Migration[5.0]
  def change
    add_column :suppliers, :qbo_id, :integer
  end
end
