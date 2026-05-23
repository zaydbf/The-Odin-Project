def stock_picker(stock)
  max_profit = 0
  l = []
  stock.each_with_index do |buy_price, buy_day|
    stock.each_with_index do |sell_price, sell_day|
      next unless buy_day < sell_day

      profit = sell_price - buy_price
      if profit > max_profit
        max_profit = profit
        l = [buy_day, sell_day]
      end
    end
  end
  l
end

puts stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
