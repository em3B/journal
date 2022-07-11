class MembersController < ApplicationController

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      flash[:success] = "You Joined the Group."
      redirect_to groups_path
    else
      flash.now[:error] = "Something went wrong. Are you in the group already ?"
      render 'new'
    end
  end

  def destroy
    @member = Member.find_by(user_id: params[:user_id], group_id: params[:group_id])
    @member.destroy
    redirect_to root_path, flash: {error: "You left the Group."}
  end

  private

  def member_params
    params.require(:member).permit(:group_id, :user_id)
  end

end
