class SpellsController < ApplicationController
  def index
    @spells = Spell.includes(:school).all
  end

  def show
    @spells = Spell.all
  end
end
