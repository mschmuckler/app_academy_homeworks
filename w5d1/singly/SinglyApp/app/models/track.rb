class Track < ApplicationRecord
  validates :title, :feature, presence: true

  FEATURES = %w(Bonus Regular)

  belongs_to :album

  has_many :notes, dependent: :destroy

  has_one :band,
    through: :album,
    source: :band

end
