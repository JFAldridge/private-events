class Event < ApplicationRecord
  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================
  belongs_to :creator, class_name: 'User'
  has_many :invitations, foreign_key: :attended_event_id
  has_many :attendees, through: :invitations, source: :attendee
  # == Validations ==========================================================

  # == Scopes ===============================================================
  scope :upcoming, -> { where("start_time >= ?", Time.now) }
  scope :past, -> { where("start_time < ?", Time.now) }
  scope :soonest_first, -> { order(:start_time) }
  scope :most_recent_first, -> { order(start_time: :desc) }
  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

end
