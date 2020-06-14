class PagesController < ApplicationController

  layout "admin"

  def index
    @pages = Page.sorted
    @page_title = "All Pages"
  end

  def show
    @page = Page.find(params[:id])
  end

  def edit
    @page_positions = Page.count 
    @subjects = Subject.sorted
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page '#{@page.name}' updated successfully"
      redirect_to(page_path(@page.id))
    else  
      @page_positions = Page.count
      @subjects = Subject.sorted
      render('edit')
    end
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
    @page_positions = Page.count + 1
    @subjects = Subject.sorted
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
      if @page.save
        flash[:notice] = "Page ''#{@page.name}' successfully created"
        redirect_to(pages_path)
      else
        @subjects = Subject.sorted
        @page_positions = Page.count + 1
        render('new')
      end
  end
  private

  def page_params
    params.require(:page).permit(:name, :position, :visible, :permalink, :subject_id)
  end

end
