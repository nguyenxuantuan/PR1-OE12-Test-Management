class CreateSessionUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :session_users do |t|

      t.timestamps
    end
  end
end
