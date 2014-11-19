class StaticController < ApplicationController
  before_filter :authenticate_user!, only: [:forum]
  
  def home
  end

  def contact
  end

  def about
  end

  def help
  end

  def forum
  end
end
