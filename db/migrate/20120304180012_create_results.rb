class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :trend_id
      t.string :user_name
      t.string :result
      t.string :post_url

      t.timestamps
    end
  end
end
