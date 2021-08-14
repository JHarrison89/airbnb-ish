class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.belongs_to :user, index: { unique: true }, foreign_key: true, optional: true
      t.belongs_to :property, index: { unique: true }, foreign_key: true, optional: true
      t.string :line_one
      t.string :line_two
      t.string :city
      t.string :post_code

      t.timestamps
    end
  end
end
