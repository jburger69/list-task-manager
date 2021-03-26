class TasksController < ApplicationController

    def index
        @task = Task.all
    end
    
    def show
    end

    def create
        @list = current_user.lists.find(params[:list_id])
        @task = @list.tasks.build(task_params)
        if @task.valid?
            @task.save
            redirect_to @list
        else
            @error = @task.errors.full_messages
            render :new
        end
    end

    def edit
        @task = Task.find(params[:id])
        render :edit
    end

    def update
        @task = Task.find(params[:id])
        @task.update(task_params)
        if @task.valid?
            @task.save
            redirect_to list_path(@task.list)
        else
            @error = @task.errors.full_messages
            render :edit
        end
    end
    

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to list_path(@task.list)
    end

    private

    def task_params
        params.require(:task).permit(:name)
    end
end
