class CreateSessionExams < ActiveRecord::Migration[5.1]
  def change
    create_table :session_exams do |t|

      t.timestamps
    end
  end
end
