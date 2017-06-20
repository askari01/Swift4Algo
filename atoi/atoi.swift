import Foundation

func _atoi(_ string: String) -> Int {
    let negative = (string[string.startIndex] == "-" ? -1 : 1)
    let numberString = string.components(separatedBy: CharacterSet.decimalDigits.inverted)
        .joined()
    
    return numberString.reduce(0) { (result, character) -> Int in
        (result*10) + Int(String(character))!
        } *  negative
}

print("-46753 => \(_atoi("-46753"))")

