class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  helper_method :sort_column, :sort_direction

  def index
    @pins = Pin.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 35, :page => params[:page])
  end

  def show
  end

  def new
    @pin = current_user.pins.build
  end

  def edit
  end

  def create
    @pin = current_user.pins.build(pin_params)
    if @pin.save
      redirect_to @pin, notice: 'Pin was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated.'
    else
      render action: 'edit'
    end
  end

def destroy
    @pin.destroy
    redirect_to pins_url
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pin.find_by(id: params[:id])
      redirect_to pins_path, notice: "not authorized to edit this post" if @pin.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:image, :title_Of_Piece, :brand, :comment)
    end

    def sort_column
      params[:sort] || "title_Of_Piece" || "brand" || "comment"
    end
  
    def sort_direction
      params[:direction] || "asc"
    end
end
