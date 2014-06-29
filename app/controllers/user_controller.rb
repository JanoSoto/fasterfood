class UserController < ApplicationController
  before_filter :authenticate_user!
  check_authorization
  load_and_authorize_resource

  def index
    @users = User.where('id != ?', current_user.id)
  end

  def show
  	raise 'a'
	redirect_to root_path
  end
  
  def new
    @user = User.new
    #render :action => 'new'
  end

  def crear
    @user = User.new(user_params)
    if @user.save
      	flash[:notice] = "Successfully created User." 
		redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated User."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to root_path
    end
  end 
  private
  	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :rut, :nombre, :apellido_paterno, :apellido_materno, :telefono, :rol)
	end
end