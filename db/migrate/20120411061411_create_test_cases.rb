class CreateTestCases < ActiveRecord::Migration
  def change
    create_table :test_cases do |t|
      t.string :test_suite
      t.string :test_id
      t.string :test_name
      t.string :duration
      t.string :status

      t.timestamps
    end
  end
end
