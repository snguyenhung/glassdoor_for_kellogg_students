class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.integer :company_id
      t.string :name

      t.timestamps
    end
  end
end
