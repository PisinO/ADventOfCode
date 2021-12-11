//
//  Day02.swift
//  AdventOfCode2021
//
//  Created by Ondřej Pišín on 08.12.2021.
//

import Foundation

class Day02: Executable {
    
    enum Instruction: String {
        case forward, down, up
    }
    
    func execute() {
        p1()
        p2()
    }
    
    func p1() {
        let final = read(file: "input02").split(separator: "\n").reduce(into: [(instruction:Instruction, steps:Int)]()) { array, s in
            let v = s.split(separator: " ")
            array.append((Instruction(rawValue: String(v[0]))!, Int(v[1])!))
        }.reduce(into: (horizontal:Int, depth:Int)(0,0), { result, v in
            switch v.instruction {
                case .up:
                    result.depth -= v.steps
                case .down:
                    result.depth += v.steps
                case .forward:
                    result.horizontal += v.steps
            }
        })
        print("P1: \(final.horizontal * final.depth)")
    }
    
    func p2() {
        let final = read(file: "input02").split(separator: "\n").reduce(into: [(instruction:Instruction, steps:Int)]()) { array, s in
            let v = s.split(separator: " ")
            array.append((Instruction(rawValue: String(v[0]))!, Int(v[1])!))
        }.reduce(into: (horizontal:Int, depth:Int, aim:Int)(0,0,0), { result, v in
            switch v.instruction {
                case .up:
                    result.aim -= v.steps
                case .down:
                    result.aim += v.steps
                case .forward:
                    result.horizontal += v.steps
                    result.depth += v.steps * result.aim
            }
        })
        print("P2: \(final.horizontal * final.depth)")
    }
}

