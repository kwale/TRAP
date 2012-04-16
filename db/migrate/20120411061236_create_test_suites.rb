class CreateTestSuites < ActiveRecord::Migration
  def change
    create_table :test_suites do |t|
      t.string :name
      t.integer :failures
      t.integer :passed
      t.integer :Nr_tests
      t.string :time
      t.timestamp :execution_time
      t.string :tag
      t.string :release

      t.timestamps
    end
  end
end
