class HomeController < ApplicationController
  def index
    @character_classes = CharacterClass.all
    @schools = School.all
  end
end
