class SpellsController < ApplicationController
  def index
    @spells = Spell.includes(:school).page(params[:page]).per(50)
  end

  def show
    @spell = Spell.find(params[:id])
  end
end
