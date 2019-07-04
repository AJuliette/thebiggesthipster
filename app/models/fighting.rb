# frozen_string_literal: true

class Fighting < ApplicationRecord
  belongs_to :character
  belongs_to :game, inverse_of: :fightings

  validates :character_id, presence: true, uniqueness: { scope: :game_id }
end
