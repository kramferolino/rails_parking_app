class CreatePaymentTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :payment_transactions do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.references :parking_session, null: false, foreign_key: true
      t.string :transaction_id
      t.decimal :total_payment

      t.timestamps
    end
  end
end
