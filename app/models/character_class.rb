class CharacterClass < ApplicationRecord
  has_and_belongs_to_many :spells, dependent: :destroy

  validates :name, uniqueness: true
  validates :name, presence: true
end
