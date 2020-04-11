class AddEmailToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :email, :string, default: "", null: false
  end
end
