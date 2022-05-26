class UsersController < ApplicationController
  def index
    @accounts = current_user.accounts
    @entries_list =
      current_user.expenses.includes(:category).to_a + current_user.transfers
    @entries_list.sort! { |a, b| b.date <=> a.date }
  end
end
