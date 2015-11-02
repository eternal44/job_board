class DeleteSecondStartTimeChoiceInJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :second_start_time_choice
  end
end
