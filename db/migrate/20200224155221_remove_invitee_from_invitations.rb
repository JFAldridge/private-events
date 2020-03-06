class RemoveInviteeFromInvitations < ActiveRecord::Migration[5.2]
  def change
    remove_reference :invitations, :invitee
  end
end
