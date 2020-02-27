class RemoveInviteeFromInvitations < ActiveRecord::Migration[5.2]
  def change
    remove_reference :invitations, :invitee, foreign_key: true
  end
end
