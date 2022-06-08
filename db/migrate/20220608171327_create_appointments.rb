class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :patient, null: false
      t.belongs_to :doctor,  null: false

      t.datetime  :start_time,     null: false
      t.string    :status,         null: false, default: "new"
      t.text      :recommendation, null: false

      t.timestamps
    end
  end
end
