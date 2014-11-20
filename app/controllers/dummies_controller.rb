class DummiesController < ApplicationController
  before_action :set_dummy, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @dummies = Dummy.all
    respond_with(@dummies)
  end

  def show
    respond_with(@dummy)
  end

  def new
    @dummy = Dummy.new
    respond_with(@dummy)
  end

  def edit
  end

  def create
    @dummy = Dummy.new(dummy_params)
    @dummy.save
    respond_with(@dummy)
  end

  def update
    @dummy.update(dummy_params)
    respond_with(@dummy)
  end

  def destroy
    @dummy.destroy
    respond_with(@dummy)
  end

  private
    def set_dummy
      @dummy = Dummy.find(params[:id])
    end

    def dummy_params
      params.require(:dummy).permit(:name, :address)
    end
end
