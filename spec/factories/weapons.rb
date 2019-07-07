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


FactoryBot.define do
  factory :weapon do
    name { 'MyString' }
    damage { 1 }
  end
end
