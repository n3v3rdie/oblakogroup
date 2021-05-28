class ProjectsController < ApplicationController
  def index
    @response = Project.all
    render json: @response, :include => {:todos => {:only => [:text, :isCompleted]}}, :except => [:created_at, :updated_at]
  end
end
