class SubjectsController < ApplicationController

  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      # flash[:notice] = "Answer saved!"
      redirect_to subject_path(@subject), notice: "Answer saved!"
    else
      render :new
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  private

  def find_subject
    Subject.all.each do |s|
      @subject = s if s.users.include?(current_user)
    end
  end

  def subject_params
    params.require(:subject).permit(:user_id, :name)
  end

end
