class InstitutionLocationData < ActiveRecord::Migration[5.1]
  def change
    create_table :campuses do |t|
      t.belongs_to :institution
      t.string :name
      t.timestamps
    end

    add_column :courses, :campus_id, :integer
    add_foreign_key :courses, :campuses
  end
end
