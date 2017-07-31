class Album < ApplicationRecord
  validates :title, :recording_style, :band_id, presence: true

  RECORDING_STYLES = %w(Live Studio)

  belongs_to :band
  has_many :tracks, dependent: :destroy

end
