require 'pry'

class GamesController < ApplicationController
  def new
    @characters = Character.all
    @game = Game.new
  end

  def create
    @characters = Character.all
    @game = Game.new(game_params)
    if @game.save
      #characters_order = @game.randomize_starter
      #@game.calculate_winner(characters_order)
      redirect_to @game
    else
      render 'new'
    end
  end

  def show
    @game = Game.find(params[:id])
  end


  private

  def game_params
    params.require(:game).permit({:character_ids => []})
  end
end
