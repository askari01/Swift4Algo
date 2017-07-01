import Foundation

func index(of pattern: String, in string:String) -> String.Index? {
    guard pattern.count <= string.count else { return nil }
    guard pattern.count > 0 else { return string.startIndex }
    
    var patternMap: [Character: Int] = {
        var i = pattern.count - 1
        var map = [Character: Int]()
        for c in pattern {
            map[c] = i
            i -= 1
        }
        return map
    }()
    
    var stringIndex = string.index(string.startIndex, offsetBy: pattern.count - 1)
    
    while true {
        let stringIndexBeforeBackMatching = stringIndex
        var patternIndex = pattern.index(pattern.startIndex, offsetBy: pattern.count - 1)
        
        while string[stringIndex] == pattern[patternIndex] {
            if patternIndex == pattern.startIndex {
                return stringIndex
            }
            
            stringIndex = string.index(stringIndex, offsetBy: -1)
            patternIndex = string.index(patternIndex, offsetBy: -1)
        }
    
        if let jump = patternMap[string[stringIndexBeforeBackMatching]] {
            stringIndex = string.index(stringIndexBeforeBackMatching, offsetBy: max(1, jump))
        }
        else {
            stringIndex = string.index(stringIndexBeforeBackMatching, offsetBy: 1)
        }
        
        if stringIndex >= string.endIndex {
            return nil
        }
    }
}

index(of: "World", in: "Hello World!")
