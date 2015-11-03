class AddAttendantIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :attendant_id, :integer
  end
end
