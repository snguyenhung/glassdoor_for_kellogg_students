class CreateStudentProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :student_profiles do |t|
      t.string :program
      t.date :graduation_year

      t.timestamps
    end
  end
end
