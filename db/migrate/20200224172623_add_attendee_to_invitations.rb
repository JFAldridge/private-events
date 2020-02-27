class AddAttendeeToInvitations < ActiveRecord::Migration[5.2]
  def change
    add_reference :invitations, :attendee, foreign_key: { to_table: 'users'}
  end
end
