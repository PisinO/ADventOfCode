//
//  Day01.swift
//  AdventOfCode2021
//
//  Created by Ondřej Pišín on 08.12.2021.
//

import Foundation

class Day01: Executable {
    
    func execute() {
        p1()
        p2()
    }
    
    private func p1() {
        let chunks = read(file: "input01").split(separator: "\n")
        var count = 0
        
        for i in 1..<chunks.count {
            if Int(chunks[i])! > Int(chunks[i-1])! { count += 1 }
        }
        print("P1: \(count)")
    }
    
    private func p2() {
        let chunks = read(file: "input01").split(separator: "\n")
        var count = 0

        var last = -1
        for i in 0..<chunks.count - 2 {
            let sum = Int(chunks[i])! + Int(chunks[i+1])! + Int(chunks[i+2])!
            if last > -1, sum > last { count += 1 }
            last = sum
        }
        print("P2: \(count)")
    }
}
