class CharacterClassesController < ApplicationController
  def index
    @character_classes = CharacterClass.order(:name)
  end

  def show
    @character_class = CharacterClass.find(params[:id])
    @spells = @character_class.spells.page(params[:page]).per(50)
  end
end
