class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if user.save
      session[:user_id] = user.id
      redirect_to 'index'
    else
      redirect_to 'index'
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end
end
