import Foundation

func basicRegx(_ string: String, exp: String) -> Bool {
    func getNextCharacter(_ string: String, offset: inout Int) -> Character? {
        guard offset < string.count else { return nil }
        let c = string[string.index(string.startIndex, offsetBy: offset)]
        offset += 1
        return c
    }
    
    guard string.count > 0 else { return false }
    
    var sOffset = 0
    var eOffset = 0
    
    var s = getNextCharacter(string, offset: &sOffset)
    var e = getNextCharacter(exp, offset: &eOffset)
    var pe: Character?
    var ps: Character?
    
    while true {
        if s == nil {
            if e == nil {
                if pe == nil {
                    return true
                }
                else {
                    return false
                }
            }
            else {
                return false
            }
        }
        if e == nil {
            return false
        }
        switch e! {
        case "*":
            if pe == nil {
                while s == ps {
                    ps = s
                    s = getNextCharacter(string, offset: &sOffset)
                }
            }
            pe = nil
            e = getNextCharacter(exp, offset: &eOffset)
        case "+":
            if pe == nil {
                while s == ps {
                    ps = s
                    s = getNextCharacter(string, offset: &sOffset)
                }
                e = getNextCharacter(exp, offset: &eOffset)
            }
            else {
                return false
            }
        case "?":
            pe = nil
            e = getNextCharacter(exp, offset: &eOffset)
        default:
            if s != e {
                if pe != nil {
                    return false
                }
                pe = e
                e = getNextCharacter(exp, offset: &eOffset)
            }
            else {
                if pe == nil {
                    ps = s
                    s = getNextCharacter(string, offset: &sOffset)
                    e = getNextCharacter(exp, offset: &eOffset)
                }
                else {
                    return false
                }
            }
        }
    }
}

print("abc - abc = \(basicRegx("abc", exp: "abc")) == true")
print("abc - abd = \(basicRegx("abc", exp: "abd")) == false")
print("abc - abcd = \(basicRegx("abc", exp: "abcd")) == false")
print("abd - abcd = \(basicRegx("abd", exp: "abcd")) == false")
print()
print("color - colou?r = \(basicRegx("color", exp: "colou?r")) == true")
print("colour - colou?r = \(basicRegx("colour", exp: "colou?r")) == true")
print("colur - colou?r = \(basicRegx("colur", exp: "colou?r")) == false")
print("coloar - colou?r = \(basicRegx("coloar", exp: "colou?r")) == false")
print("colouur - colou?r = \(basicRegx("colouur", exp: "colou?r")) == false")
print("colouar - colou?r = \(basicRegx("colouar", exp: "colou?r")) == false")
print()
print("abc - ab*c = \(basicRegx("abc", exp: "ab*c")) == true")
print("abbc - ab*c = \(basicRegx("abbc", exp: "ab*c")) == true")
print("abbbc - ab*c = \(basicRegx("abbbc", exp: "ab*c")) == true")
print("ac - ab*c = \(basicRegx("ac", exp: "ab*c")) == true")
print("adc - ab*c = \(basicRegx("adc", exp: "ab*c")) == false")
print("abdc - ab*c = \(basicRegx("abdc", exp: "ab*c")) == false")
print("adbc - ab*c = \(basicRegx("adbc", exp: "ab*c")) == false")
print()
print("abc - ab+c = \(basicRegx("abc", exp: "ab+c")) == true")
print("abbc - ab+c = \(basicRegx("abbc", exp: "ab+c")) == true")
print("abbbc - ab+c = \(basicRegx("abbbc", exp: "ab+c")) == true")
print("ac - ab+c = \(basicRegx("ac", exp: "ab+c")) == false")
print("adc - ab+c = \(basicRegx("adc", exp: "ab+c")) == false")
print("abdc - ab+c = \(basicRegx("abdc", exp: "ab+c")) == false")
print("adbc - ab+c = \(basicRegx("adbc", exp: "ab+c")) == false")

