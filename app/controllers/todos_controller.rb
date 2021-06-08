class TodosController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  
  def create
    @project = Project.find_or_create_by(id: params['project_id'], title: params['title'])
    if @project.invalid?
      render json: @project.errors, status: :unprocessable_entity
      return
    end
      
    @todo = Todo.create(text: params['text'], isCompleted: params['isCompleted'], project: @project)
    if @todo.save
#      render json: @todo, :except => [:created_at, :updated_at]
#      render json: @project, :include => {:todos => {:except => [:created_at, :updated_at]}}, :except => [:created_at, :updated_at]
      render json: @todo, :include => [:project => {:except => [:created_at, :updated_at]} ], :except => [:created_at, :updated_at]

      return
    else
      render json: @todo.errors, status: :unprocessable_entity
      return
    end
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(isCompleted: params['isCompleted'])
      render json: @todo, :except => [:created_at, :updated_at]
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

end
