class RemoveAttendeeIdFromInvitations < ActiveRecord::Migration[5.2]
  def change
    remove_column :invitations, :attendee_id, :integer
  end
end
