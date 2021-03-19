class TasksController < ApplicationController

    def index
        @task = Task.all
    end

    def create
        @list = List.find(params[:list_id])
        @task = @list.tasks.build(task_params)
        @task.save
        redirect_to @list
    end

    def task_params
        params.require(:task).permit(:name, :status)
    end
end
