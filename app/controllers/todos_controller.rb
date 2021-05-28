class TodosController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  
  def create
    if params['project_id']
      @project = Project.find(params['project_id'])
    else
      @project = Project.create(title: params['title'])
    end      
    Todo.create(text: params['text'], isCompleted: params['isCompleted'], project: @project)
  end

  def update
    @project = Project.find(params[:project_id])
    @todo = @project.todos[params[:id].to_i]
    @todo.update(isCompleted: params['isCompleted'])
  end

end
