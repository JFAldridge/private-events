class CreateTableInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :table_invitations do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :accepted

      t.timestamps
    end
  end
end
