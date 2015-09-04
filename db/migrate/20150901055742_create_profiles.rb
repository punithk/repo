class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :address
      t.string :bloodgroup
      t.integer :phone

      t.timestamps
    end
  end
end
