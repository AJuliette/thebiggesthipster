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

FactoryBot.define do
  factory :character do
    name { 'MyString' }
    health_points { 35 }
    attack_damage { 7 }
    avatar { Rack::Test::UploadedFile.new('../tmp/captaincontrat.jpg', 'image/jpg') }
  end
end
