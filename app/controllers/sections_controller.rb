class SectionsController < ApplicationController

  layout "admin"

  before_action :find_pages, :only => [:new, :create, :edit, :update]
  before_action :set_section_count, :only => [:new, :create, :edit, :update]

  def index
    @sections = Section.sorted
    @page_title = "All Sections"
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section '#{@section.name}' created successfully"
      redirect_to(sections_path)
    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section '#{@section.name}' updated successfully"
      redirect_to(section_path(@section.id))
    else
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

  private

  def section_params
    params.require(:section).permit(:name, :position, :visible, :content_type, :content, :page_id)
  end

  def find_pages
    @pages = Page.sorted
  end

  def set_section_count
    @section_positions = Section.count
    if params[:action] == "new" || params[:action] == "create"
      @section_positions+=1
    end
  end
  
end
