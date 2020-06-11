class SectionsController < ApplicationController
  def index
    @sections = Section.all
  end

  def show
    @section = Seciton.find(params[:id])
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
      flash[:notice] = "Section'#{@subject.name}' updated successfully"
      redirect_to(section_path(@subject.id))
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

  def section_params
    params.require(:section).permit(:name, :position, :visible, :content_type, :content, :page_id)
  end
  
end
