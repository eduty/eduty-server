class MoreInfoToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :kind, :string
    add_column :courses, :level, :string
    add_column :courses, :shift, :string
  end
end
