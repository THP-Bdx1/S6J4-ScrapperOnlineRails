class CreateCryptos < ActiveRecord::Migration[5.2]
  def change
    create_table :cryptos do |t|
      t.string :crypto_name
      t.string :crypto_value

      t.timestamps
    end
  end
end
