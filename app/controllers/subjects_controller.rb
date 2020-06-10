class SubjectsController < ApplicationController
  #reading
  def index
    #uses the named scope defined in the model to sort by position
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  #creating
  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save 
      flash[:notice] = "Subject '#{@subject.name}' created successfully"
      redirect_to(subjects_path)
    else
      render('new')
    end
  end

  #updating
  def edit
    @subject = Subject.find(params[:id])
  end
  
  def update
   @subject = Subject.find(params[:id])

   if @subject.update_attributes(subject_params)
    #redirect to the 'show' view after a successful update
    flash[:notice] = "Subject '#{@subject.name}' updated successfully"
      redirect_to(subject_path(@subject))
   else 
      render('edit')
   end
  end

  #deleting
  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' destroyed successfully"
    redirect_to(subjects_path)
  end

  private
  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
