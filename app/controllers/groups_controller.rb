class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :group, only: [:show, :update, :update_group_members, :destroy]

  def index
    render json: { 
      group: "#{current_user.groups.to_json}",  
      message: "List of all the Group #{current_user.email} is part of" 
    }, 
    status: :ok
  end 

  def create 
    render json: {
      group: Group.create!(group_params),
      message: "Group Created Successfully."
    }, 
    status: :ok
  end 

  def show
    render json: {
      group: ,
      group_members: group.group_members
    }
  end 

  def update
    group.update!(group_params)
    render json: {
      group: ,
      message: "#{group.name} updated successfully."
    },
    status: :ok
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
    render json: {
      group: group.destroy!, 
      message: "Deleted #{group.name}"
    }, 
    status: :ok
  end 

  private 

    def group 
      @_group ||= Group.find(params[:id])
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
