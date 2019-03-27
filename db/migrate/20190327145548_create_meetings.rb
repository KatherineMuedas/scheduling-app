class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.string :slug, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :meetings, :slug, unique: true
  end
end
