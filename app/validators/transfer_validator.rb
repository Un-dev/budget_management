class TransferValidator < ActiveModel::Validator
  def validate(record)
    if record.from_account_id == record.to_account_id
      record.errors[:error] << 'From and To accounts cannot be the same'
    end
  end
end
