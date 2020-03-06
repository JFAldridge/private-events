class RemoveAttendedEventFromInvitations < ActiveRecord::Migration[5.2]
  def change
    remove_reference :invitations, :attended_event
  end
end
