class CreateStudentpairs < ActiveRecord::Migration[5.1]
  def change
    create_table :studentpairs do |t|
      t.integer :student1
      t.integer :student2
      t.date :date

      t.timestamps
    end
  end
end
