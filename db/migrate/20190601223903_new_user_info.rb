class NewUserInfo < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cpf, :string
    add_column :users, :birth_date, :datetime
    add_column :courses, :semesters, :integer

    create_table :campaigns do |t|
      t.belongs_to :user
      t.belongs_to :course
      t.string :description
    end

    create_table :campaign_media do |t|
      t.belongs_to :campaign
      t.string :kind
      t.string :url
    end

    create_table :payments do |t|
      t.belongs_to :user
      t.belongs_to :campaign
      t.decimal :value
      t.string :method
    end
  end
end
