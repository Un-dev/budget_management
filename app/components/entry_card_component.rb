class EntryCardComponent < ViewComponent::Base
  attr_reader :entry

  def before_render
    @link =
      if entry.class.name == 'Transfer'
        edit_transfer_path(@id)
      else
        edit_expense_path(@id)
      end
  end

  def initialize(entry: nil)
    @id = entry.id
    @title =
      if entry.class.name == 'Expense'
        entry.title
      else
        "#{entry.from_account.title} -> #{entry.to_account.title}"
      end
    @color =
      entry.class.name == 'Expense' ? entry.category.hex_color : '#7E7165'
    @date = entry.date
    @amount = entry.amount
    @amount_color = @amount > 0 ? 'text-green-400' : ''
    @icon =
      if entry.class.name == 'Expense'
        entry.category.icon
      else
        '<svg xmlns="http://www.w3.org/2000/svg" class="h-7 w-7" fill="none" viewBox="0 0 24 24" stroke="white" stroke-width="2">
          <path stroke-linecap="round" stroke-linejoin="round" d="M8 7h12m0 0l-4-4m4 4l-4 4m0 6H4m0 0l4 4m-4-4l4-4" />
        </svg>'
      end
  end
end
