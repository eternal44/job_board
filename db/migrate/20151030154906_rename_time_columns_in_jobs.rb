class RenameTimeColumnsInJobs < ActiveRecord::Migration
  def change
    rename_column :jobs, :start_time, :first_start_time_choice
    rename_column :jobs, :end_time, :second_start_time_choice
  end
end
