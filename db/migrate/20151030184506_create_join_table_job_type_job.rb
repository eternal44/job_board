class CreateJoinTableJobTypeJob < ActiveRecord::Migration
  def change
    create_join_table :job_types, :jobs do |t|
      t.index [:job_type_id, :job_id]
      t.index [:job_id, :job_type_id]
    end
  end
end
