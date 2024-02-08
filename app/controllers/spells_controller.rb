class SpellsController < ApplicationController
  def index
    @spells = Spell.includes(:school).page(params[:page]).per(50)
  end

  def show
    @spell = Spell.find(params[:id])
  end

  def search
    name_search = "%#{params[:keywords]}%"
    @spells = Spell.where("name LIKE ?", name_search).page(params[:page]).per(50)
  end
end
