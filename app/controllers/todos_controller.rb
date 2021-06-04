class TodosController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  
  def create
    if params['project_id'] and params['project_id'] != ''
      @project = Project.find(params['project_id'])
    else
      @project = Project.create(title: params['title'])
    end      
    @todo = Todo.create(text: params['text'], isCompleted: params['isCompleted'], project: @project)
    render json: @todo, :except => [:created_at, :updated_at]
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(isCompleted: params['isCompleted'])
    render json: @todo, :except => [:created_at, :updated_at]
  end

end
