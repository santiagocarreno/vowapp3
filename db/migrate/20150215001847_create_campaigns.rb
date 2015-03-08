class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.integer :Campaign_id
      t.string :name
      t.date :date_start
      t.date :date_end
      t.string :days
      t.string :hours
      t.string :status_campaign

      t.timestamps null: false
    end
  end
end
