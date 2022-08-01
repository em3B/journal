class GroupsController < ApplicationController
  def index
    if current_user.teacher
      @groups = Group.where(user_id: current_user.id)
    end
  end

  def new
    @group = Group.new
    @user = User.new
    @member = Member.new
    @user.id = @member.user_id
    @member.group_id = @group.id
    # add_user
    @subjects = Subject.all
  end

  # def add_user
  #   @members = Member.all
  #   @member = Member.create(group_id: @group.id)
  #   @user = User.new
  #   @user.id = @member.user_id
  #   # @user.id = @member.user_id
  # end

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
    # @answer = Answer.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  private

  def member_params
    params.require(:member).permit(abyme_attributes, :group_id, :user_id)
  end

  def group_params
    params.require(:group).permit(abyme_attributes, :user_id, :name,
                                  user_attributes: %(id, username, email, password))
  end
end
