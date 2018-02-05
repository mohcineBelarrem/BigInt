//
//  main.swift
//  BigInt
//
//  Created by Mohcine on 2/5/18.
//  Copyright © 2018 Mohcine Belarrem. All rights reserved.
//

import Foundation

class BigInt : CustomStringConvertible {
    
    var arr = [Int]()
    
    init(_ val : String) {
        arr = val.flatMap{Int(String($0))}
    }
    
    var size : Int {
        return arr.count
    }
    
    static func + (left: BigInt, right: BigInt) -> BigInt {
        
        let mx = max(left.size, right.size)
        
        left.leadFill(size: mx)
        right.leadFill(size: mx)
        
        let sum = BigInt(String(repeating: "0", count: mx))
        
        var reste = 0
        
        for i in (0...mx-1).reversed() {
            
            let s = reste + left.arr[i] + right.arr[i]
            
            if s >= 10 {
                sum.arr[i] = s - 10
                reste = 1
            }
            else {
                sum.arr[i] = s
                reste = 0
            }
        }
        
        if reste > 0 {
            sum.arr.insert(reste, at: 0)
        }
        return sum
    }
    
    
    public var description : String {
        var str = ""
        for a in arr {
            str += "\(a)"
        }
        return str
    }
    
    func leadFill(size : Int) {
        
        let diff = size-self.size
        
        if diff >= 1 {
            for _ in 1...(diff) {
                self.arr.insert(0, at: 0)
            }
        }
    }
}



let bi = BigInt("99929292")
let br = BigInt("21345683")

let s = bi + br

print(s)
