module FormattingHelper

  def f_date(date)
    date && date.strftime('%m/%d/%Y').strip
  end

  def f_time_ago(time)

  end

  def f_money(amount)
    amount && "$#{number_with_delimiter(amount, :separator => ',')}"
  end
end
