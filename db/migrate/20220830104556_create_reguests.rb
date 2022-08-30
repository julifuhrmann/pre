class CreateReguests < ActiveRecord::Migration[7.0]
  def change
    create_table :reguests do |t|
      t.integer :status
      t.references :party, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
