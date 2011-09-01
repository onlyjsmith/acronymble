class AcronymController < ApplicationController
  def index
    @acronyms = Acronym.find(:all, :order => :letters)
  end

  def show
  end
  
  def upload_text
    
  end

end
