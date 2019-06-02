class AddLogoToUniversity < ActiveRecord::Migration[5.1]
  def change
    add_column :institutions, :logo_url, :string
  end
end
