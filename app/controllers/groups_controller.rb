class GroupsController < ApplicationController
  def index
    if current_user.teacher
      @groups = Group.where(user_id: current_user.id)
    end
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      # flash[:notice] = "Answer saved!"
      redirect_to group_path(@group), notice: "Group saved!"
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @answer = Answer.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  private

  def find_group
    Group.all.each do |g|
      @group = g if g.users.include?(current_user)
    end
  end
  end

  def group_params
    params.require(:group).permit(:user_id, :name)
  end
