class StaticPageController < ApplicationController
  def home
    @book = Book.all
  end
  
  def new
    @staff = Staff.new
  end
  
  def create
    @staff = Staff.new(staff_params)

    respond_to do |format|
      if @staff.save
        format.html { redirect_to root_path, notice: 'Staff was successfully created.' }
        format.json { render :show, status: :created, location: @staff }
      else
        format.html { render :new }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def staff_params
      params.require(:staff).permit(:name, :birthday, :gender, :phone, :address, :email, :user, :password, :password_confirmation)
    end
end
