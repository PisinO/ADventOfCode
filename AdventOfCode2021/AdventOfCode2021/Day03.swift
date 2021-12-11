//
//  Day03.swift
//  AdventOfCode2021
//
//  Created by Ondřej Pišín on 08.12.2021.
//

import Foundation

class Day03: Executable {
    
    func execute() {
        p1()
    }
    
    private func p1() {
        let chunks = read(file: "input03").split(separator: "\n")
        var val = ""
        for i in 0..<chunks[0].count {
            val.append(chunks.map({ ($0 as NSString).character(at: i) }).sorted().firstIndex(of: 49)! >= chunks.count/2 ? "0" : "1")
            print(chunks.map({ ($0 as NSString).character(at: i) }).sorted().firstIndex(of: 49)!)
        }
        print("P1: \(Int(val, radix: 2)! * Int(String(val.map({ $0 == "0" ? "1" : "0" })), radix: 2)!)")
    }
}
