class CreateSmsStatuses < ActiveRecord::Migration
  def change
    create_table :sms_statuses do |t|
      t.string :phone
      t.text :message
      t.boolean :status

      t.timestamps null: false
    end
  end
end
