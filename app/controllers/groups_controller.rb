class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :group, only: [:show, :update, :update_group_members, :destroy]

  def index
    @groups = current_user.groups
    render json: @groups, status: :ok
  end 

  def create 
    @group = Group.create!(group_params)
    render json: @group, status: :ok
  end 

  def show
    convert_to_param = params[:convert_to].blank? ? "EUR" : params[:convert_to]
    render json: { group: , 
      group_members: group.group_members, 
      group_expenses: group.group_expenses,
      group_split_expenses: group.split_calculation(convert_to_param)
    }, 
    status: :ok
  end 

  def update
    @group = group.update!(group_params)
    render json: @group, status: :ok
  end

  def update_group_users
    ActiveRecord::Base.transaction do
      add_new_members
      remove_members
    end
    render json: { message: "Update members of the #{group.name}"}, 
    status: :ok
  end 

  def destroy
    @group = group.destroy!
    render json: @group, status: :ok
  end 

  private 

    def group 
      @group ||= Group.find(params[:id])
    end  

    def group_params
      params.require(:group).permit(:name, :description, group_users_attributes: [:user_id]).with_defaults(created_by_id: current_user.id)
    end

    def add_new_members
      return if params[:add_member_ids].blank?
      add_member_params = params[:add_member_ids].map do |member_id|
        { group_id: params[:id], user_id: member_id }
      end 
      GroupUser.create!(add_member_params)
    end 

    def remove_members
      return if params[:removed_member_ids].blank?
      params[:removed_member_ids].each do |member_id|
        GroupUser.where(user_id: member_id, group_id: params[:id]).delete_all 
      end
    end
end
