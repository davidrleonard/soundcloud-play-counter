class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.integer :play_count
      t.timestamps null: false
    end
  end
end
