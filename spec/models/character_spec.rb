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

require 'rails_helper'

RSpec.describe Character, type: :model do
  subject(:character) { described_class.new }

  context 'when testing validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_numericality_of(:health_points).is_greater_than_or_equal_to(30).is_less_than_or_equal_to(40) }
    it { is_expected.to validate_numericality_of(:attack_damage).is_greater_than_or_equal_to(5).is_less_than_or_equal_to(10) }
  end

  it 'is not valid if name is too long' do
    character.name = 'a' * 16
    expect(character).not_to be_valid
  end

  it 'is not valid if name is too short' do
    character.name = 'a' * rand(1..3)
    expect(character).not_to be_valid
  end

  describe 'avatar' do
    let(:character) { build(:character, avatar: nil) }

    it "is not valid if there's no avatar" do
      error = 'Validation failed: Character must have a profile picture'
      expect { character.save! }.to raise_error(ActiveRecord::RecordInvalid, error)
    end
  end
end
