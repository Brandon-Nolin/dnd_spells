class SpellsController < ApplicationController
  def index
    @spells = Spell.includes(:school).page(params[:page]).per(50)
  end

  def show
    @spell = Spell.find(params[:id])
  end

  def search
    @name_search = "%#{params[:keywords]}%"

    if params[:school] && params[:school][:name]
      @school = params[:school][:name]
    else
      @school = ""  # Set to empty string if not found
    end
    
    if params[:class] && params[:class][:name]
      @character_class = params[:class][:name]
    else
      @character_class = ""  # Set to empty string if not found
    end

    @spells = Spell.where("name LIKE ?", @name_search).page(params[:page]).per(50)

    if @school.present? && @character_class.present?
      @spells = Spell.joins(:school, :character_classes)  # Adjusted association name here
                     .where("spells.name LIKE ? AND schools.name = ? AND character_classes.name = ?", @name_search, @school, @character_class)
                     .page(params[:page]).per(50)
    elsif @school.present?
      @spells = Spell.joins(:school)
                     .where("spells.name LIKE ? AND schools.name = ?", @name_search, @school)
                     .page(params[:page]).per(50)
    elsif @character_class.present?
      @spells = Spell.joins(:character_classes)  # Adjusted association name here
                     .where("spells.name LIKE ? AND character_classes.name = ?", @name_search, @character_class)
                     .page(params[:page]).per(50)
    else
      @spells = Spell.where("name LIKE ?", @name_search)
                     .page(params[:page]).per(50)
    end
  end
end
