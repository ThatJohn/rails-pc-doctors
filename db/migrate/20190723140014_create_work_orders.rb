class CreateWorkOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :work_orders do |t|
      t.text :jobname
      t.string :status
      t.belongs_to :technician, index: true
      t.belongs_to :client, index: true

      t.timestamps
    end
  end
end