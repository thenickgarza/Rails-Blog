class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.references :user, null: false, foreign_key: true
      t.string :from
      t.string :to
      t.string :description

      t.timestamps
    end
  end
end
