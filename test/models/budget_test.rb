require 'test_helper'

class BudgetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @first_budget = Budget.find_by(starts_at: '01-01-2022')
    @second_budget = Budget.find_by(starts_at: '01-02-2022')
    @third_budget = Budget.find_by(starts_at: '01-03-2022')
  end
  test '#next' do
    next_budget = Budget.next(@first_budget)
    assert_equal @second_budget, next_budget
    next_budget = Budget.next(@second_budget)
    assert_equal @third_budget, next_budget
    next_budget = Budget.next(@third_budget)
    assert_equal @third_budget, next_budget
  end

  test '#previous' do
    previous_budget = Budget.previous(@first_budget)
    assert_equal @first_budget, previous_budget
    previous_budget = Budget.previous(@second_budget)
    assert_equal @first_budget, previous_budget
    previous_budget = Budget.previous(@third_budget)
    assert_equal @second_budget, previous_budget
  end
end
