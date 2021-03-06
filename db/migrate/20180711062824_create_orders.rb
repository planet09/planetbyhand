class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :o_id
      t.string :del_addr
      t.string :detail_addr
      t.string :post_code
      t.integer :total_pay
      t.integer :del_pay
      t.datetime :or_time
      t.datetime :pay_time
      t.integer :amount
      t.string :invoice_code

      t.timestamps null: false
    end
  end
end
