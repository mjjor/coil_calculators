class LandingPageController < ApplicationController
  
  layout 'application'

  def index
  	render('index')
  end
end
