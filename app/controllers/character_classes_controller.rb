class CharacterClassesController < ApplicationController
  def index
    @character_classes = CharacterClass.order(:name)
  end

  def show
    @character_class = CharacterClass.includes(:spells).find(params[:id])
  end
end
