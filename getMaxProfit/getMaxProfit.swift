import Foundation

enum ProfitError : Error {
    case arrayTooShort
}

func getMaxProfit(stockPrices: [Int]) throws -> (Int, Int, Int) {
    guard stockPrices.count >= 2 else { throw ProfitError.arrayTooShort }
    
    var minPrice = min(stockPrices[0], stockPrices[1])
    var buy = stockPrices[0]
    var sell = stockPrices[1]
    var maxProfit = sell - buy
    
    for price in stockPrices[2..<stockPrices.count] {
        if price < minPrice {
            let potentialProfit = price - minPrice
            if potentialProfit > maxProfit {
                maxProfit = potentialProfit
                buy = minPrice
                sell = price
            }
            minPrice = price
        }
        else {
            let potentialProfit = price - buy
            if potentialProfit > maxProfit {
                maxProfit = potentialProfit
                buy = minPrice
                sell = price
            }
        }
    }
    
    return (maxProfit, buy, sell)
}

try! print(getMaxProfit(stockPrices: [10, 7, 5, 8, 11, 9]))
try! print(getMaxProfit(stockPrices: [10, 7, 5, 8, 11, 9, 50]))
try! print(getMaxProfit(stockPrices: [10, 7, 5, 8, 11, 9, 50, 2]))
try! print(getMaxProfit(stockPrices: [10, 7, 5, 8, 11, 9, 50, 2, 65]))
try! print(getMaxProfit(stockPrices: [10, 9, 8, 7, 6, 5]))
try! print(getMaxProfit(stockPrices: [10, 8, 7]))

