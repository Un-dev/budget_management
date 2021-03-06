class TransfersController < ApplicationController
  before_action :find_transfer, except: %i[index new create]

  def index
    redirect_to :home
  end
  def new
    @transfer = Transfer.new
  end

  def create
    @transfer = Transfer.new(transfer_params)
    if @transfer.save
      redirect_to url_for(controller: :users, action: :index)
    else
      render :new
    end
  end

  def edit
    @transfer = Transfer.update(transfer_params)
  end

  def update; end

  def find_transfer
    @transfer = Transfer.find(params[:id])
  end

  def transfer_params
    params
      .require(:transfer)
      .permit(:title, :date, :amount, :from_account_id, :to_account_id)
  end
end
