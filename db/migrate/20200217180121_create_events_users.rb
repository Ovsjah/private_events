class CreateEventsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :events_users do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
