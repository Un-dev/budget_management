class AccountsController < ApplicationController
  before_action :find_account, except: %i[index new create]
  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to url_for(controller: :users, action: :index)
    else
      render :new
    end
  end

  def account_params
    params.require(:account).permit(:title, :balance, :main_account, :user_id)
  end

  def find_account
    @account = Account.find(params[:id])
  end

  def destroy
    @account.destroy
  end

  def update
    if @account.update(account_params)
      redirect_to url_for(controller: :users, action: :index)
    else
      render :edit
    end
  end
end
