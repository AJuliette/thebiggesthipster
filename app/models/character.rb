# frozen_string_literal: true

# == Schema Information
#
# Table name: characters
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  health_points :integer          not null
#  attack_damage :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Character < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4, maximum: 20 }
  validates :health_points, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 30,
    less_than_or_equal_to: 40
  }
  validates :attack_damage, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 5,
    less_than_or_equal_to: 10
  }

  validates :avatar, file_content_type: { allow: ['image/jpeg', 'image/gif', 'image/png', 'image/jpg'],
  message: 'only %{types} are allowed' }, if: -> { avatar.attached? }
  validate :presence_of_avatar

  has_one_attached :avatar

  has_many :turns, class_name: 'Turn', foreign_key: 'attacker_id', dependent: :destroy
  has_many :turns, class_name: 'Turn', foreign_key: 'attacked_id', dependent: :destroy

  has_many :games, class_name: 'Game', foreign_key: 'player_a_id', dependent: :destroy
  has_many :games, class_name: 'Game', foreign_key: 'player_b_id', dependent: :destroy

  def attack(weapon)
    attack_damage + rand(1..weapon.damage)
  end

  def is_attacked(attack)
    self.health_points = health_points - attack
  end

  def dead?
    health_points <= 0
  end

  def percentage_of_wins
    if games.empty?
      'NA'
    else
      ((Game.where(winner_id: id).size * 100) / games.size).to_i.to_s + '%'
    end
  end

  def games
    Game.where(player_a_id: id) + Game.where(player_b_id: id)
  end

  private

  def presence_of_avatar
    errors.add(:character, 'must have a profile picture') unless avatar.attached?
  end
end
