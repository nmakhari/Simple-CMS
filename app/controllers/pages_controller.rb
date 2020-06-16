class PagesController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in
  before_action :find_subject
  before_action :set_page_count, :only => [:edit, :update, :new, :create]

  def index
    @pages = @subject.pages.sorted
    @page_title = "All Pages"
  end

  def show
    @page = Page.find(params[:id])
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page '#{@page.name}' updated successfully"
      redirect_to(page_path(@page.id, :subject_id => @subject.id))
    else  
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
    redirect_to(pages_path(:subject_id => @subject.id))
  end

  def new
    @page = Page.new(:subject_id => @subject.id)
  end

  def create
    @page = Page.new(page_params)
    @page.subject = @subject
      if @page.save
        flash[:notice] = "Page ''#{@page.name}' successfully created"
        redirect_to(pages_path(:subject_id => @subject.id))
      else
        render('new')
      end
  end
  private

  def page_params
    params.require(:page).permit(:name, :position, :visible, :permalink)
  end

  def find_subject
    @subject = Subject.find(params[:subject_id])
  end

  def set_page_count
    @page_positions = Page.count 
    if params[:action] == 'new' || params[:action] == 'create'
      @page_positions+=1
    end
  end

end
