class CreateTechnicians < ActiveRecord::Migration[5.2]
  def change
    create_table :technicians do |t|
      t.text :name

      t.timestamps
    end
  end
end
