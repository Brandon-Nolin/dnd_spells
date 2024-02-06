class Spell < ApplicationRecord
  has_and_belongs_to_many :character_classes, dependent: :destroy
  belongs_to :school

  validates :name, uniqueness: true
  validates :name, :description, :level, :duration, :cast_time, :range, presence: true
  validates :level, numericality: {only_integer: true, in: 0..9}
end
