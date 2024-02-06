class School < ApplicationRecord
  has_many :spells

  validates :name, uniqueness: true
  validates :name, presence: true
end
