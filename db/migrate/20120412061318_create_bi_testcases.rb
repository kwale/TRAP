class CreateBiTestcases < ActiveRecord::Migration
  def change
    create_table :bi_testcases do |t|
      t.string :suite_id
      t.string :test_case_id
      t.string :tag
      t.integer :time
      t.timestamp :timestamp
      t.string :release
      t.string :status

      t.timestamps
    end
  end
end
