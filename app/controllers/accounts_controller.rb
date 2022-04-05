class AccountsController < ApplicationController
  def index; end

  def transfer; end

  def execute_transfer
    sender_account = Account.find(params[:sender_id])
    receiver_account = Account.find(params[:receiver_id])
    sender_account.transfer(receiver_account, params[:amount].to_f)
    redirect_to home_path
  end
end
