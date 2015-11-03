class RenameTitleColumnInJobs < ActiveRecord::Migration
  def change
    rename_column :jobs, :title, :subject
  end
end
