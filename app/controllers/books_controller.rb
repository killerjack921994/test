class BooksController < ApplicationController
  before_action :authentication
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
    if current_staff.admin
    elsif current_staff.id == @book.staff_id
    else
      redirect_to books_path
    end
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    if current_staff.admin
    elsif current_staff.id == @book.staff_id
    else
      redirect_to books_path
    end
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    
    params[:book][:category].delete("")
    @array_category = params[:book][:category]
    @category = Category.find(@array_category)
    
    respond_to do |format|
      if @book.save
        
        @book.category << @category
        
        flash[:success] = 'Book was successfully created.'
        format.html { redirect_to new_book_path }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    
    params[:book][:category].delete("")
    @array_category = params[:book][:category]
    @category = Category.find(@array_category)
    
    respond_to do |format|
      if @book.update(book_params)
        
        @book.category.delete_all
        @book.category << @category
        
        flash[:success] = 'Book was successfully updated.'
        format.html { redirect_to edit_book_path }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      flash[:success] = 'Book was successfully destroyed.'
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:name, :description, :price, :image_url, :image, :staff_id, :author_id, :manufacturer_id, :category) #them :image
    end

    def authentication
      if logged_in?
      else
        redirect_to login_path
      end
    end
end
