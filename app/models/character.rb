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
  validates :name, presence: true, length: { minimum: 8, maximum: 20 }
  validates :health_points, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 80,
    less_than_or_equal_to: 100
  }
  validates :attack_damage, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 10,
    less_than_or_equal_to: 20
  }

  has_one_attached :avatar
  validates :avatar, file_content_type: { allow: ['image/jpeg', 'image/gif', 'image/png', 'image/jpg'],
                                          message: 'only %{types} are allowed' }, if: -> { avatar.attached? }
  validate :presence_of_avatar

  private

  def presence_of_avatar
    errors.add(:character, 'must have a profile picture') unless avatar.attached?
  end
end
