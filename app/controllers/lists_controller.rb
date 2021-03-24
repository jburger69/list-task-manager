class ListsController < ApplicationController

    def index
        @list = List.new
        @lists = List.all
    end

    def show
        @list = List.find(params[:id])
        @task = Task.new
    end

    def new
        @list = List.new
        @list.tasks.build
    end

    def create
        @list = current_user.lists.new(list_params)
        if @list.save
            @user_list = UserList.create(list_id: @list.id, user_id: current_user.id)
            redirect_to @list
        else
            render :new
        end
    end

    def destroy
        @list= List.find(params[:id])
        @list.destroy
        redirect_to @list
    end
    
    private

    def list_params
        params.require(:list).permit(:name, tasks_attributes: [:name, :status])
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end
