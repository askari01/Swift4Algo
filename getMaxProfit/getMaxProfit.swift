import Foundation

func getMaxProfitQuadratic(stockPrices array: [Int]) -> Int {
    var profit = 0
    
    var pos = 0
    for value in array {
        var bestProfitForValue = 0
        for sell in array[pos+1..<array.count] {
            bestProfitForValue = sell - value
            if bestProfitForValue > profit {
                profit = bestProfitForValue
            }
        }
        
        pos += 1
    }
    
    return profit
}

func getMaxProfit(stockPrices array: [Int]) -> (Int, Int)? {
    guard array.count > 2 else { return nil }
    
    var buy = array[0]
    var sell = array[1]
    
    var previous = array[1]
    for value in array[2..<array.count] {
        if value > sell {
            sell = value
            if previous < buy {
                buy = previous
            }
        }
        else {
            if (sell - buy) <= (value - previous) && previous < buy {
                buy = previous
                sell = value
            }
        }
        
        previous = value
    }
    
    return (buy, sell)
}


print(getMaxProfit(stockPrices: [1, 3, 5])) // v > s
print(getMaxProfit(stockPrices: [1, 3, 2])) //
print(getMaxProfit(stockPrices: [3, 1, 5])) // v > s
print(getMaxProfit(stockPrices: [3, 1, 2])) // v > s
print(getMaxProfit(stockPrices: [5, 3, 4])) // v > s
print(getMaxProfit(stockPrices: [5, 3, 2])) //
print("")
print(getMaxProfit(stockPrices: [23, 7, 2, 8, 11, 3, 6, 12, 5, 10])) // 2 12
print(getMaxProfit(stockPrices: [10, 7, 5, 8, 11, 9])) // 5 11
print(getMaxProfit(stockPrices: [10, 7, 5, 8, 11, 9, 50])) // 5 50
print(getMaxProfit(stockPrices: [10, 7, 5, 8, 11, 9, 50, 2])) // 5 50
print(getMaxProfit(stockPrices: [10, 7, 5, 8, 11, 9, 50, 3, 65])) // 3 65
print(getMaxProfit(stockPrices: [10, 7, 2, 8, 11, 9, 50, 3, 65])) // 2 65
print(getMaxProfit(stockPrices: [10, 9, 8, 7, 6, 5])) // 6 5
print(getMaxProfit(stockPrices: [10, 8, 7])) // 8 7


