class SignupController < ApplicationController
  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.create!(developer_params)
    redirect_to root_path, notice: "Welcome!"
  end

  private

  def developer_params
    params.require(:developer).permit(:email, :password, :password_confirmation)
  end
end
