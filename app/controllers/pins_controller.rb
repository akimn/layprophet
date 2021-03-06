class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  helper_method :sort_column, :sort_direction

  def index
    @pins = Pin.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 50, :page => params[:page])
    #@pins = Pin.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 50)
  end

  def show
  end

  def new
    @pin = current_user.pins.build
  end

  def edit
  end

  def create
    #@pin = current_user.pins.build(pin_params)
    #if @pin.save
     # redirect_to @pin, notice: 'Pin was successfully created.'
    #else
     # render action: 'new'
    #end


    @pin = current_user.pins.build(pin_params)

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin }
        #format.html { redirect_to @pin, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pin }
      else
        format.html { render action: 'new' }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
   # if @pin.update(pin_params)
    #  redirect_to @pin, notice: 'Pin was successfully updated.'
   # else
    #  render action: 'edit'
    #end


    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to @pin }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to pins_url }
      format.json { head :no_content }
    end
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this post" if @pin.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:image, :title_Of_Piece, :brand, :comment)
    end

    def sort_column
      params[:sort] || "comment" || "brand" || "title_Of_Piece"
    end
  
    def sort_direction
      params[:direction] || "asc"
    end
end
