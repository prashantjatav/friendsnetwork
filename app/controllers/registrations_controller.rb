class RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    @user = User.new(params[:user])
    profile = @user.build_profile
    profile.build_photo
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
