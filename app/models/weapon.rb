# frozen_string_literal: true

# == Schema Information
#
# Table name: weapons
#
#  id         :bigint           not null, primary key
#  name       :string
#  damage     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_url  :string
#


class Weapon < ApplicationRecord
  validates :name, presence: true
  validates :damage, presence: true

  has_many :games, class_name: 'Game', foreign_key: 'weapon_a_id', dependent: :destroy
  has_many :games, class_name: 'Game', foreign_key: 'weapon_b_id', dependent: :destroy
end
