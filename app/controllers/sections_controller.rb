class SectionsController < ApplicationController

  layout "admin"

  def index
    @sections = Section.all
    @page_title = "All Sections"
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
    @section_positions = Section.count + 1
    @pages = Page.sorted
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section '#{@section.name}' created successfully"
      redirect_to(sections_path)
    else
      @section_positions = Section.count + 1
      @pages = Page.sorted
      render('new')
    end
  end

  def edit
    @section_positions = Section.count 
    @pages = Page.sorted
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section '#{@section.name}' updated successfully"
      redirect_to(section_path(@section.id))
    else
      @section_positions = Section.count 
      @pages = Page.sorted
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Section '#{@section.name}' was successfully destroyed"
    redirect_to(sections_path)
  end

  def section_params
    params.require(:section).permit(:name, :position, :visible, :content_type, :content, :page_id)
  end
  
end
