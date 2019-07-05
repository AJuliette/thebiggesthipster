# frozen_string_literal: true

class Weapon < ApplicationRecord
  has_many :games, class_name: 'Game', foreign_key: 'weapon_a_id'
  has_many :games, class_name: 'Game', foreign_key: 'weapon_b_id'
end
