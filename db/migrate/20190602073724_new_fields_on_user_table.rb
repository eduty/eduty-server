class NewFieldsOnUserTable < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :phone_number, :string
  end
end
