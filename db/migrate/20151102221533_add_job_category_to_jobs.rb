class AddJobCategoryToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :job_categories, :string
  end
end
