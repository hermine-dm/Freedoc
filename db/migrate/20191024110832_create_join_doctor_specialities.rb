class CreateJoinDoctorSpecialities < ActiveRecord::Migration[5.2]
  def change
    create_table :join_doctor_specialities do |t|
      t.belongs_to :doctor, index: true
      t.belongs_to :specialty, index: true
      t.timestamps
    end
  end
end
