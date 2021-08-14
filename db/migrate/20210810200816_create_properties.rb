class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.belongs_to :user, index: { unique: true }, foreign_key: true
      t.integer :beds
      t.string :amenities
      t.integer :min_stay
      t.integer :price

      t.timestamps
    end
  end
end
