class PublicController < ApplicationController

  def index
    #show a layout
  end

  def show
    @page = Page.visible.where(:permalink => params[:permalink]).first
    if @page.nil?
      redirect_to(action: 'index')
    else
      #will redirect to the show view
    end
  end
end
