# frozen_string_literal: true

# == Schema Information
#
# Table name: games
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  player_a_id :bigint
#  player_b_id :bigint
#  weapon_a_id :bigint
#  weapon_b_id :bigint
#  winner_id   :bigint
#


require 'rails_helper'

RSpec.describe Game, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
