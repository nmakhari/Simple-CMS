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
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Page '#{@page.name}' successfully destroyed"
    redirect_to(pages_path)
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
      if @page.save
        flash[:notice] = "Page ''#{@page.name}' successfully created"
        redirect_to(pages_path)
      else
        render('new')
      end
  end
  private

  def page_params
    params.require(:page).permit(:name, :position, :visible, :permalink, :subject_id)
  end

end
