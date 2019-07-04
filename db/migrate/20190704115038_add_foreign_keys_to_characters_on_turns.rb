# frozen_string_literal: true

class AddForeignKeysToCharactersOnTurns < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :turns, :characters, column: :attacker_id
    add_foreign_key :turns, :characters, column: :attacked_id
  end
end
