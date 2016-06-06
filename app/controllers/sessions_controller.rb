class SessionsController < ApplicationController
  def new
  end
  
  def create
    staff = Staff.find_by(email: params[:session][:email].downcase)
    if staff && staff.authenticate(params[:session][:password])
      log_in staff
      redirect_to admin_path
    else
      render 'new'
    end
  end
  
  def destroy
    log_out_admin
    redirect_to root_path
  end
end
