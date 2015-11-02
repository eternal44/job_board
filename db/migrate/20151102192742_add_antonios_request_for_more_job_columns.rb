class AddAntoniosRequestForMoreJobColumns < ActiveRecord::Migration
  def change
    add_column :jobs, :priority, :string
    add_column :jobs, :overdue, :boolean, default: false
    add_column :jobs, :number_of_workers, :integer
    add_column :jobs, :min_hours, :integer
    add_column :jobs, :max_hours, :integer
    add_column :jobs, :price_per_worker, :decimal
  end
end
