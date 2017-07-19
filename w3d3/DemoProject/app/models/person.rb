class Person < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  belongs_to(
    :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'House'
  )
end # class
