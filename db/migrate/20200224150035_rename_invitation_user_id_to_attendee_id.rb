class RenameInvitationUserIdToAttendeeId < ActiveRecord::Migration[5.2]
  def change
    rename_column :invitations, :user_id, :invitee_id
  end
end
