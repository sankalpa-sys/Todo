class TodosController < ApplicationController
  before_action :current_todo, only: [:show, :edit, :update, :destroy]
  def index
    @todos = current_user.todos
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = current_user.todos.new(todo_params)
    if @todo.save
      redirect_to todos_path
      flash[:notice] = "Your work was added."
    else
      redirect_to new_todo_path
      flash[:alert] = @todo.errors.full_messages.join(', ')
    end
  end

  def edit
    unless @todo
      redirect_to todos_path
      flash[:alert] = 'Todo task not found.'
    end
  end

  def update
    @todo.update(todo_params)
    redirect_to todos_path
    flash[:notice] = "Your work was updated."
  end

  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :description)
  end

  def current_todo
    @todo = current_user.todos.find_by_id(params[:id])
    unless @todo
      redirect_to todos_path
      flash[:alert] = 'Todo task not found.'
    end
  end
end
