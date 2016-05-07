class SignupController < ApplicationController
  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(developer_params)

    respond_to do |format|
      if @developer.save
        format.html { redirect_to projects_path, notice: "Welcome aboard! Get started by adding a project!" }
      else
        format.html { render :new }
      end
    end
  end

  private

  def developer_params
    params.require(:developer).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
