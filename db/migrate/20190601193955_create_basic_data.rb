class CreateBasicData < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :name
      t.string :slug
      t.timestamps
    end

    create_table :institutions do |t|
      t.string :name
      t.string :kind
      t.timestamps
    end

    create_table :courses do |t|
      t.string :name
      t.belongs_to :institution
      t.decimal :price
      t.timestamps
    end

    create_table :fundings do |t|
      t.decimal :goal
      t.belongs_to :user
      t.timestamps
    end

    create_table :transactions do |t|
      t.belongs_to :funding
      t.decimal :value
      t.string :kind
      t.timestamps
    end
  end
end
