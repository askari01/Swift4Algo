import Foundation

func removeToMakeAnagram(str1: String, str2: String) -> Int {
    var sstr1 = str1.sorted()
    var sstr2 = str2.sorted()
    var s1Index = sstr1.startIndex
    var s2Index = sstr2.startIndex
    
    var removed = 0
    
    while s1Index < sstr1.endIndex && s2Index < sstr2.endIndex {
        let c1 = sstr1[s1Index]
        let c2 = sstr2[s2Index]
        
        if c1 == c2 {
            s1Index = sstr1.index(after: s1Index)
            s2Index = sstr2.index(after: s2Index)
        }
        else if c1 < c2 {
            removed += 1
            s1Index = sstr1.index(after: s1Index)
        }
        else {
            removed += 1
            s2Index = sstr2.index(after: s2Index)
        }
    }
    
    while s1Index < sstr1.endIndex {
        removed += 1
        s1Index = sstr1.index(after: s1Index)
    }
            
    while s2Index < sstr2.endIndex {
        removed += 1
        s2Index = sstr2.index(after: s2Index)
    }
            
    return removed
}

removeToMakeAnagram(str1: "cdehi", str2: "abcfghl")

