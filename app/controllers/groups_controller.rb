class GroupsController < ApplicationController
  def index
    if current_user.teacher
      @groups = Group.where(user_id: current_user.id)
  end

  def show
    @group = Group.find(params[:id])
    @answer = Answer.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  private

  def find_reading_group
    Group.all.each do |g|
      @group = g if g.users.include?(current_user)
    end
  end
  end

  def reading_group_params
    params.require(:group).permit(:user_id, :name)
  end
end
