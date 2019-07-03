# frozen_string_literal: true

class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      redirect_to @character, notice: 'Character created'
    else
      render 'new'
    end
  end

  def show
    @character = current_character
  end

  def edit
    @character = current_character
  end

  def update
    @character = current_character
    if @character.update(character_params)
      redirect_to @character, notice: 'Character updated'
    else
      render 'edit'
    end
  end

  def destroy
    @character = current_character
    @character.destroy
    redirect_to characters_path
  end

  private

  def character_params
    params.require(:character).permit(:name, :attack_damage, :health_points, :avatar)
  end

  def current_character
    Character.find(params[:id])
  end
end
