class CreateTrends < ActiveRecord::Migration
  def change
    create_table :trends do |t|
      t.string :query, :null => false

      t.timestamps
    end
  end
end
