# frozen_string_literal: true

class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all
    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end
end
