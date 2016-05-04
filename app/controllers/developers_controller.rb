class DevelopersController < ApplicationController
  def dashboard
    @developers = Developer.all
  end

  def index
    @developers = Developer.all
  end

  def show
    @developer = Developer.find(params[:id])
  end

  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.create!(developer_params)
    redirect_to root_path, notice: "Developer added"
  end

  def edit
    @developer = Developer.find(params[:id])
  end

  def update
    @developer = Developer.find(params[:id])
    @developer.update(developer_params)
    redirect_to developer_path(@developer), notice: "Developer updated"
  end

  def destroy
    Developer.find(params[:id]).destroy
    redirect_to root_path, notice: "Developer deleted"
  end

  private

  def developer_params
    params.require(:developer).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
