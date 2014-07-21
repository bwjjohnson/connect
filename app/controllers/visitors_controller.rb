class VisitorsController < ApplicationController
  before_filter :force_signin 
  before_action :set_visitor, only: [:show, :edit, :update, :destroy]

  def force_signin
    redirect_to new_user_session_path unless user_signed_in?
  end

  def index
    @visitors = Visitor.all
  end

  def show
  end

  def new
    @visitor = Visitor.new
  end

  def edit
  end

  def created
  end

  def create
    @visitor = Visitor.new(visitor_params)

    if @visitor.save
      if current_user.connect?
        redirect_to '/visitors/created'
      else
        redirect_to @visitor, notice: 'Visitor was successfully created.'
      end
    else
      render :new 
    end
  end

  def update
    if @visitor.update(visitor_params)
      redirect_to @visitor, notice: 'Visitor was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @visitor.destroy
    redirect_to visitors_url, notice: 'Visitor was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitor
      @visitor = Visitor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visitor_params
      params.require(:visitor).permit(:name, :email, :phone, :user_id)
    end
end
