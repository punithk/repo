class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.references :user

      t.timestamps
    end
    add_index :images, :user_id
  end
end
