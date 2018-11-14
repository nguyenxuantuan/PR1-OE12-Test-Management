class CreateQuestionExams < ActiveRecord::Migration[5.1]
  def change
    create_table :question_exams do |t|

      t.timestamps
    end
  end
end
