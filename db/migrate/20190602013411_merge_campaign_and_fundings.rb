class MergeCampaignAndFundings < ActiveRecord::Migration[5.1]
  def change
    drop_table :fundings

    add_column :campaigns, :goal, :decimal

    remove_column :transactions, :funding_id

    add_column :transactions, :campaign_id, :integer
    add_foreign_key :transactions, :campaigns
  end
end
