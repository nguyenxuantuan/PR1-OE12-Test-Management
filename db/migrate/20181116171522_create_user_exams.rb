class CreateUserExams < ActiveRecord::Migration[5.1]
  def change
    create_table :user_exams do |t|
      t.string :student_answer
      t.float :scores
      t.string :title
      t.string :answer_true

      t.timestamps
    end
  end
end
