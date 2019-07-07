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


require 'rails_helper'

RSpec.describe Weapon, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
