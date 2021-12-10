class AddCompanyReferenceToJobs < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :jobs, :companies
    add_index :jobs, :company_id
    change_column_null :jobs, :company_id, false
  end
end
