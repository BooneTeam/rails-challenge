class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :website_full_url
      t.string :google_short_url
      t.timestamps
    end
  end
end
