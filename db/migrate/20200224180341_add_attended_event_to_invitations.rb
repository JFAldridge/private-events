class AddAttendedEventToInvitations < ActiveRecord::Migration[5.2]
  def change
    add_reference :invitations, :attended_event, foreign_key: { to_table: 'events'}
  end
end
