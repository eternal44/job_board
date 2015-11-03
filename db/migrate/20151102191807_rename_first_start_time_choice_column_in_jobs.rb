class RenameFirstStartTimeChoiceColumnInJobs < ActiveRecord::Migration
  def change
    rename_column :jobs, :first_start_time_choice, :appointment_date_time
  end
end
