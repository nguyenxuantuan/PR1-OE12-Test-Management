class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.string :exam_name
      t.integer :period_for
      t.string :supervisor

      t.timestamps
    end
  end
end
