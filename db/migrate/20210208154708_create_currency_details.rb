class CreateCurrencyDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :currency_details do |t|
      t.date :rate_date
      t.text :details
      t.timestamps
    end
  end
end
