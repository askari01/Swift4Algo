// Given an API to find all IPv4 addresses in a log file, find all IPs that occurred only once.
// Follow-up: What if the log comes from a data stream.
// Follow-up: If the machine has 4GB RAM, is there going to be a problem?

import Foundation

class IPDuplicateFinder {
    var data: Data
    
    init() {
        data = Data(capacity: 256*256*256*32)
    }
    
    func checkIP(ip: String) -> Bool {
        var found = false
        
        let ottets = ip.split(separator: ".").flatMap{ Int($0) }.filter{ $0 < 256 }
        
        if ottets.count == 4 {
            let byte:UInt8 = UInt8(ottets[3])
            let group = Int(byte/8)
            let bit = Int(byte - UInt8(group*8))
            let pointerPos = (ottets[0] * 256 * 256 * 32) + (ottets[1] * 256 * 32) + (ottets[2] * 32) + group

            print(pointerPos)
            
            data.withUnsafeMutableBytes { (pointer: UnsafeMutablePointer<UInt8>) in
                if (pointer[pointerPos] >> bit) & 1 != 0 {
                    found = true
                }

                pointer[pointerPos] |= 1 << bit
            }
        }
        
        return found
    }
}


var duplicate = IPDuplicateFinder()
duplicate.checkIP(ip: "120.0.0.1")
duplicate.checkIP(ip: "120.0.0.1")
duplicate.checkIP(ip: "120.0.0.7")
duplicate.checkIP(ip: "120.0.0.8")
duplicate.checkIP(ip: "120.0.0.8")
duplicate.checkIP(ip: "120.0.0.7")
duplicate.checkIP(ip: "120.0.0.255")
duplicate.checkIP(ip: "120.0.0.255")
duplicate.checkIP(ip: "120.0.1.255")
duplicate.checkIP(ip: "120.1.0.255")
duplicate.checkIP(ip: "121.0.0.255")
duplicate.checkIP(ip: "255.0.0.1")
duplicate.checkIP(ip: "255.255.0.1")
duplicate.checkIP(ip: "255.255.255.1")
duplicate.checkIP(ip: "255.255.255.255")
duplicate.checkIP(ip: "255.255.255.255")
duplicate.checkIP(ip: "255.255.255.1")






var byteArray = [UInt8](repeating: 0, count: 32)

let byte:UInt8 = 17

let group = byte/8
let bit = byte - (group*8)

//SET
byteArray[Int(group)] |= 1 << bit

//CHECK
(byteArray[Int(group)] >> bit) & 1



