class PagesController < ApplicationController

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
  end

  def delete
    
  end

  def destroy
  end

  def new
    @page = Page.new
  end

  def create
  end

  

end
