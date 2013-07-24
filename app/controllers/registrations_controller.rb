class RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    @user = User.new(params[:user])
    @user.build_profile
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def show
  @user = User.find(params[:id])

  end


end
