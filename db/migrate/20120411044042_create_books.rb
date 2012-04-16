class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :subject_id

      t.timestamps
    end
  end
end
