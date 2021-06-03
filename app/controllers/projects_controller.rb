class ProjectsController < ApplicationController
  def index
    @response = Project.all
    render json: @response, :include => {:todos => {:except => [:created_at, :updated_at]}}, :except => [:created_at, :updated_at]
  end
end
