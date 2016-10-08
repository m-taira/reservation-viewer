class CreateExecutions < ActiveRecord::Migration[5.0]
  def change
    create_table :executions do |t|
      t.datetime :execute_datetime
      t.string :kind

      t.timestamps
    end
  end
end
