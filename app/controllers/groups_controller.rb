class GroupsController < ApplicationController
  def index
    if current_user.teacher
      @groups = Group.where(user_id: current_user.id)
    end
  end

  def new
    @group = Group.new
    add_user
  end

  def add_user
    @member = Member.new
    @member.group_id = @group.id
    @user = @member.user
    # @user.id = @member.user_id
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

  def member_params
    params.require(:member).permit(:group_id, :user_id)
  end

  def group_params
    params.require(:group).permit(:user_id, :name)
  end
end
