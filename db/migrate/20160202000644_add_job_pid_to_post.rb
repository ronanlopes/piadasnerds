class AddJobPidToPost < ActiveRecord::Migration
  def change
    add_column :posts, :job_pid, :string
  end
end
