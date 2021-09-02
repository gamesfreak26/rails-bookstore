class AddCurrencyToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :currency, :string, default: "aud", null: false
  end
end
