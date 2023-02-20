class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :invoice, null: false, foreign_key: true
      t.string :name
      t.bigint :price

      t.timestamps
    end
  end
end
