//: iOS Development Lesson 2 HomeWork 1

import UIKit

class Money {
    var currency : String
    
    init(currency : String) {
        self.currency = currency
    }
}

class Converter : Money {
    
    func convert(value : Double, startCurrency : String, targetCurrency : String)
        -> (convertedValue : Double, targetCurrency : String) {
            
            let dollarValue = getDollarValue(startCurrency, value: value)
            var returnValue : Double
            
            switch targetCurrency {
            case "EUR":
                returnValue = dollarValue * 0.87873
                break
            case "GBP":
                returnValue = dollarValue * 0.64610
                break
            case "JPY":
                returnValue = dollarValue * 118.887
                break
            case "CHF":
                returnValue = dollarValue * 0.950958
                break
            case "AUD":
                returnValue = dollarValue * 1.36483
                break
            case "USD":
                returnValue = dollarValue
                break
            case "CAD":
                returnValue = dollarValue * 0.77759
                break
            default:
                returnValue = value
                break

            }
            
            return (returnValue, targetCurrency)
    }
    
    func convert(value : Double, startCurrency : Money, targetCurrency : Money)
        -> (convertedValue : Double, targetCurrency : String) {
            
            let dollarValue = getDollarValue(startCurrency.currency, value: value)
            var returnValue : Double
            
            switch targetCurrency.currency {
            case "EUR":
                returnValue = dollarValue * 0.87873
                break
            case "GBP":
                returnValue = dollarValue * 0.64610
                break
            case "JPY":
                returnValue = dollarValue * 118.887
                break
            case "CHF":
                returnValue = dollarValue * 0.950958
                break
            case "AUD":
                returnValue = dollarValue * 1.36483
                break
            case "USD":
                returnValue = dollarValue
                break
            case "CAD":
                returnValue = dollarValue * 0.77759
                break
            default:
                returnValue = value
                break
                
            }
            
            return (returnValue, targetCurrency.currency)

    }
    
    func getDollarValue(startCurrency : String, value : Double) -> Double {
        var dollarValue : Double
        
        switch startCurrency {
        case "EUR":
            dollarValue = value * 1.13836
            break
        case "GBP":
            dollarValue = value * 1.54560
            break
        case "JPY":
            dollarValue = value * 0.00841
            break
        case "CHF":
            dollarValue = value * 1.05206
            break
        case "AUD":
            dollarValue = value * 0.73282
            break
        case "CAD":
            dollarValue = value * 1.28602
            break
        default:
            dollarValue = value
            break
            
        }
        
        return dollarValue
    }
    
}

var converter : Converter = Converter(currency: "USD")

var GBPtoEUR = converter.convert(1, startCurrency: "GBP", targetCurrency: "EUR")
var GBPtoUSD = converter.convert(1, startCurrency: "GBP", targetCurrency: "USD")
var USDtoEUR = converter.convert(1, startCurrency: "USD", targetCurrency: "EUR")
var USDtoCAD = converter.convert(1, startCurrency: "USD", targetCurrency: "CAD")

print(GBPtoEUR)
print(GBPtoUSD)
print(USDtoEUR)
print(USDtoCAD)

var currency1 = Money(currency: "USD")
var currency2 = Money(currency: "EUR")

var EURtoUSD = converter.convert(100, startCurrency: currency1, targetCurrency: currency2)
print(EURtoUSD)








