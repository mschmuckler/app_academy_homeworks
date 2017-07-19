class House < ActiveRecord::Base
  validates :type, uniqueness: true, presence: true

  has_many(
    :residents,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'Person'
  )
end # class
