# frozen_string_literal: true

class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all
  end
end
