class RenameTableTableInvitationsAsInvitations < ActiveRecord::Migration[5.2]
  def change
    rename_table :table_invitations, :invitations
  end
end
