class CreateAnnouncements < ActiveRecord::Migration[7.0]
  def change
    create_table :announcements do |t|
      t.string :title
      t.references :user

      t.timestamps
    end
  end
end
